import 'package:flutter/material.dart';
class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Accueil - Client")),
      body: Center(child: Text("Page d’accueil (vide) - Client")),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) async {
          if (i == 3) {
            Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
            return;
          }
          setState(() => _index = i);
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.content_cut), label: "Services"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
        ],
      ),
    );
  }
}