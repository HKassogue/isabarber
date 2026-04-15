import 'package:flutter/material.dart';
import 'package:isabarder/WelcomePage.dart';
import 'package:isabarder/pages/PriseRendezVous.dart';
import 'package:isabarder/pages/Service.dart';
import 'package:isabarder/pages/RDV.dart';
import 'package:isabarder/pages/ProfilUser.dart';

class Bottonnavigation extends StatefulWidget {
  const Bottonnavigation({super.key});

  @override
  State<Bottonnavigation> createState() => _BottonnavigationState();
}

class _BottonnavigationState extends State<Bottonnavigation> {
  int _selectedIndex = 0;

  // Liste des pages
  static List<Widget> _pages = [
    Welcomepage(), // Page d'accueil
    Service(), // Page des services
    PriseRendezVous(),

    Profiluser(), // Page de profil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Page courante
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF667eea),
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // Change de page
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(
            icon: Icon(Icons.design_services),
            label: "Service",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Rendez-vous",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
