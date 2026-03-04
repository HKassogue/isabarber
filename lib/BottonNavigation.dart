import 'package:flutter/material.dart';

import 'package:isabarder/pages/ProfilUser.dart';

class Bottonnavigation extends StatelessWidget {
  const Bottonnavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: const Color(0xFF667eea),
    unselectedItemColor: Colors.grey,
    currentIndex: 0,
    items: [
    const BottomNavigationBarItem(

    icon: Icon(Icons.home),
    label: "Accueil",
    ),
    const BottomNavigationBarItem(
    icon: Icon(Icons.calendar_today),
    label: "Rendez-vous",
    ),
    const BottomNavigationBarItem(
    icon: Icon(Icons.favorite),
    label: "Favoris",
    ),
    BottomNavigationBarItem(

    icon: IconButton(onPressed: (){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Profiluser()),
      );
    }, icon: const Icon(Icons.person)),
    label: "Profil",
    ),

    ],
    );
  }
}
