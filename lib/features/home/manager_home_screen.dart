import 'package:flutter/material.dart';
import 'package:isabarber/features/home/services_screen.dart';
//import 'package:isabarder/features/home/services_screen.dart';
import 'bookings_screen.dart';
import 'staff_screen.dart';

class ManagerHomeScreen extends StatefulWidget {
  const ManagerHomeScreen({super.key});

  @override
  State<ManagerHomeScreen> createState() => _ManagerHomeScreenState();
}

class _ManagerHomeScreenState extends State<ManagerHomeScreen> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    // Liste des pages selon BottomNavigationBar
    final pages = [
      _HomeContent(), // Page Home joliment décorée
      const ServicesScreen(),
      const StaffScreen(),
      const BookingsScreen(),
      Container(), // Placeholder pour Logout
    ];

    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.content_cut),
            label: "Services",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_outlined),
            label: "Staff",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Bookings",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
        ],
        onTap: (i) {
          if (i == 4) {
            Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
            return;
          }
          setState(() => _index = i);
        },
      ),
    );
  }
}

// Contenu moderne de la page Home
class _HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Banner
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: AssetImage('assets/images/salon_banner.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(16),
            child: const Text(
              "Bienvenue chez ISA Barber",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(color: Colors.black45, blurRadius: 4)],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Info rapide : chiffres clés
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween),
          const SizedBox(height: 20),

          // Section présentation du salon
          Text(
            "À propos d’ISA Barber",
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const Text(
              "ISA Barber est votre salon de coiffure premium pour hommes et femmes, "
              "offrant des services professionnels, des coiffeurs spécialisés et "
              "une expérience de qualité pour tous nos clients.",
              style: TextStyle(height: 1.4, color: Colors.black87),
            ),
          ),
          const SizedBox(height: 20),

          // Images du salon
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _SalonImageCard(image: 'assets/images/salon1.jpg'),
                _SalonImageCard(image: 'assets/images/salon2.jpg'),
                _SalonImageCard(image: 'assets/images/salon3.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Carte pour info rapide
class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final IconData icon;

  const _InfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: color,
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

// Carte image salon
class _SalonImageCard extends StatelessWidget {
  final String image;

  const _SalonImageCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
    );
  }
}
