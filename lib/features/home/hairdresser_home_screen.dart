import 'package:flutter/material.dart';

class HairdresserHomeScreen extends StatefulWidget {
  const HairdresserHomeScreen({super.key});

  @override
  State<HairdresserHomeScreen> createState() => _HairdresserHomeScreenState();
}

class _HairdresserHomeScreenState extends State<HairdresserHomeScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Accueil - Coiffeur")),
      body: Center(child: Text("Page d’accueil (vide) - Coiffeur")),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) async {
          if (i == 4) {
            Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
            return;
          }
          setState(() => _index = i);
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: "Appointments"),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: "Availability"),
          BottomNavigationBarItem(icon: Icon(Icons.photo_library_outlined),
              label: "Portfolio"),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
        ],
      ),
    );
  }
}