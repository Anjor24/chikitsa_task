// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'add_medicine.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 2;
  // List<Map<String, dynamic>> medicines = [];
  List<Map<String, dynamic>> medicines = [
    {"name": "Paracetamol", "medicineTime": "Before Breakfast", "day": "1"},
    {"name": "Vitamin C", "medicineTime": "Before Breakfast", "day": "2"},
  ];
  List<Map<String, dynamic>> afternoonData = [
    {"name": "Paracetamol", "medicineTime": "After Food", "day": "1"},
    {"name": "Vitamin C", "medicineTime": "After Food", "day": "2"},
  ];
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _showConnectionDialog();
    });
  }

  void _scrollLeft() {
    setState(() {
      selectedDate = selectedDate.subtract(const Duration(days: 1));
    });
  }

  void _scrollRight() {
    setState(() {
      selectedDate = selectedDate.add(const Duration(days: 1));
    });
  }

  void _showConnectionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Your device is not connected",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/robot.png", height: 200),
              const SizedBox(height: 20),
              const Text(
                "Connect your device with",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.bluetooth,
                          size: 30, color: Colors.white),
                      onPressed: _enableBluetooth,
                    ),
                    IconButton(
                      icon:
                          const Icon(Icons.wifi, size: 30, color: Colors.white),
                      onPressed: _connectToWifi,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _enableBluetooth() async {
    var status = await Permission.bluetooth.request();

    if (status.isGranted) {
      FlutterBluePlus.startScan();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bluetooth Scanning Started')));
      Navigator.pop(context);
    } else {
      openAppSettings();
    }
  }

  void _connectToWifi() async {
    String ssid = "Your_SSID";
    String password = "Your_Password";

    bool connected = await WiFiForIoTPlugin.connect(ssid, password: password);

    if (connected) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Connected to Wi-Fi')));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to connect to Wi-Fi')));
    }
  }

  void _navigateToAddMedicine() async {
    final medicine = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddMedicinesPage()),
    );

    print("Received Medicine Data: $medicine");

    if (medicine != null) {
      setState(() {
        medicines.add(medicine);
      });
      print("Updated Medicines List: $medicines");
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEEE, MMM d').format(selectedDate);
    String prevDay =
        DateFormat('E').format(selectedDate.subtract(const Duration(days: 1)));
    String nextDay =
        DateFormat('E').format(selectedDate.add(const Duration(days: 1)));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hi Harry!",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "${medicines.length} Medicines Left",
                        style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.medical_services,
                          color: Color.fromARGB(255, 72, 18, 120),
                          size: 30,
                        ),
                        onPressed: _navigateToAddMedicine,
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfilePage()),
                          );
                        },
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage("assets/avatar.jpg"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    prevDay, // Show Previous Day (e.g., Thu)
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_left, color: Colors.blue),
                    onPressed: _scrollLeft,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      formattedDate, // Show Selected Date (e.g., Saturday, Sep 3)
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right, color: Colors.blue),
                    onPressed: _scrollRight,
                  ),
                  Text(
                    nextDay, // Show Next Day (e.g., Sat)
                    style: const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                "Morning 08:00 Am",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: medicines.length,
              itemBuilder: (context, index) {
                final medicine = medicines[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.pink[100],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 6, right: 6),
                                  child: Image.asset(
                                    'assets/tablet.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  medicine["name"]!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      medicine["medicineTime"]!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      medicine["day"]!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.notifications_none_outlined,
                                color: Colors.greenAccent,
                              ),
                              Text("Taken")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                "AfterNoon 02:00 pm",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: afternoonData.length,
              itemBuilder: (context, index) {
                final medicine = afternoonData[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.pink[100],
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 6, right: 6),
                                  child: Image.asset(
                                    'assets/tablet.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  medicine["name"]!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      medicine["medicineTime"]!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      medicine["day"]!,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.notifications_none_outlined,
                                color: Colors.greenAccent,
                              ),
                              Text("Taken")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
