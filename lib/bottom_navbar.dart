import 'package:chikitsa_app/add_medicine.dart';
import 'package:chikitsa_app/homepage.dart';
import 'package:flutter/material.dart';
import 'report_page.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddMedicinesPage()),
      );
      return;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildNavItem(Icons.home, "Home", 0),
              const SizedBox(width: 60),
              _buildNavItem(Icons.bar_chart, "Report", 2),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onItemTapped(1),
        backgroundColor: const Color.fromARGB(255, 6, 6, 6),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return HomePage(); // Show HomePage first
      case 2:
        return ReportPage();
      default:
        return HomePage(); // Default fallback to HomePage
    }
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon,
              color: _selectedIndex == index ? Colors.blue : Colors.grey,
              size: 30),
          Text(label,
              style: TextStyle(
                  color: _selectedIndex == index ? Colors.blue : Colors.grey)),
        ],
      ),
    );
  }
}
