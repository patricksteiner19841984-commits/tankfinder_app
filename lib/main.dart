
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'map_page.dart';

void main() {
  runApp(const TankFinderApp());
}

class TankFinderApp extends StatelessWidget {
  const TankFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TankFinder',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget fuelButton(BuildContext context, String title, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MapPage(),
              ),
            );
          },
          icon: Icon(icon, color: Colors.white),
          label: Text(
            title,
            style: const TextStyle(fontSize: 20),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        elevation: 0,
        centerTitle: true,
        title: const Text("TankFinder"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),

                const Text(
                  "Wähle deinen Kraftstoff",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                fuelButton(
                  context,
                    "Bleifrei 95", 
                    Icons.local_gas_station,
                  Colors.black),

                fuelButton(
                  context,
                    "Bleifrei 98", 
                    Icons.local_gas_station,
                  Colors.green),

                fuelButton(
                  context,
                    "Bleifrei V-Power",
                    Icons.local_gas_station,
                  Colors.orange),

                fuelButton(
                   context, 
                    "Diesel", 
                    Icons.local_gas_station,
                   Colors.blue),

                fuelButton(
                    context,
                    "Diesel V-Power", 
                    Icons.star,
                   Colors.red),
              ],
            ),
          ),
        ),
      ),
    );
  }
}