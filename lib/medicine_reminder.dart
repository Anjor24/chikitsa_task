import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Report"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Today's Report
            const Text(
              "Today’s Report",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                reportCard("Total", "5"),
                reportCard("Taken", "3"),
                reportCard("Missed", "1"),
                reportCard("Snoozed", "1"),
              ],
            ),
            const SizedBox(height: 20),
            // Check Dashboard
            const Text(
              "Check Dashboard",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Text(
                    "Here you will find everything related to your active and past medicines.",
                    textAlign: TextAlign.center,
                  ),
                  CircularProgressIndicator(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Check History
            const Text(
              "Check History",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                dayButton("SUN"),
                dayButton("MON"),
                dayButton("TUE"),
                dayButton("WED"),
                dayButton("THU"),
                dayButton("FRI"),
              ],
            ),
            const SizedBox(height: 20),
            // Medication History
            medicationCard("Morning 08:00 am", "Calpol 500mg Tablet",
                "Before Breakfast", "Day 01", Icons.check_circle, Colors.green),
            medicationCard("Morning 08:00 am", "Calpol 500mg Tablet",
                "Before Breakfast", "Day 27", Icons.cancel, Colors.red),
            medicationCard("Afternoon 02:00 pm", "Calpol 500mg Tablet",
                "After Food", "Day 01", Icons.access_alarm, Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget reportCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
  }

  Widget dayButton(String day) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(day),
    );
  }

  Widget medicationCard(String time, String name, String instruction,
      String day, IconData icon, Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(instruction),
                  Text(day),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
