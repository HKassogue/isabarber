import 'package:flutter/material.dart';

/// Modèle des pages
class OnboardPageData {
  final IconData icon;
  final String title;
  final String description;

  const OnboardPageData({
    required this.icon,
    required this.title,
    required this.description,
  });
}

const onboardPages = [
  OnboardPageData(
    icon: Icons.calendar_month,
    title: "Réservez en 2 minutes",
    description: "Choisissez une prestation, un coiffeur et un créneau disponible.",
  ),
  OnboardPageData(
    icon: Icons.notifications_active,
    title: "Rappels & suivi",
    description: "Suivez l’état de vos rendez-vous et gérez l’historique.",
  ),
  OnboardPageData(
    icon: Icons.bar_chart,
    title: "Gestion salon",
    description: "Le gérant gère les services, le staff et les statistiques.",
  ),
];

/// PageView

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();  // Création du PageController
  int _index = 0;

  // void _goLogin() {
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (_) => const LoginScreen()),
  //   );
  // }

  void _goLogin() => Navigator.pushReplacementNamed(context, '/login');

  void _next() {
    if (_index < onboardPages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    } else {
      _goLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _index == onboardPages.length - 1;

    return Scaffold(
        body: SafeArea(
            child: Column(
                children: [
            // Header (Skip)
            Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                const SizedBox(width: 64),
            const Text("ISA Barber"),
            TextButton(onPressed: _goLogin, child: const Text("Skip")),
                ],
            ),
        ),
      // Slides : Affichage des pages et mise à jour de l’index
      Expanded(
        child: PageView.builder(
          controller: _controller,
          itemCount: onboardPages.length,
          onPageChanged: (i) => setState(() => _index = i),
          itemBuilder: (_, i) => _SlideView(data: onboardPages[i]),
        ),
      ),

      // Dots + Buttons next & back
      _Dots(current: _index, total: onboardPages.length),
      const SizedBox(height: 16),
      Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 18),
          child: Row(
              children: [
          Expanded(
          child: OutlinedButton(
          onPressed: _index == 0
              ? null
              : () => _controller.previousPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    ),
            child: const Text("Back"),
          ),
          ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _next,
                    child: Text(isLast ? "Get Started" : "Next"),
                  ),
                ),
              ],
          ),
      ),
                ],
            ),
        ),
    );
  }
}

/// Slide view

class _SlideView extends StatelessWidget {
  final OnboardPageData data;
  const _SlideView({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
          width: 84,
          height: 84,
          decoration: BoxDecoration(
            color: const Color(0xFF8A2BE2).withOpacity(0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(data.icon, size: 40, color: const Color(0xFF8A2BE2)),
        ),
        const SizedBox(height: 22),
        Text(
          data.title,
          textAlign: TextAlign.center,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
        ),
            const SizedBox(height: 10),
            Text(
              data.description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black54,
                height: 1.35,
              ),
            ),
          ],
        ),
    );
  }
}

/// Indicateurs dots

class _Dots extends StatelessWidget {
  final int current;
  final int total;

  const _Dots({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (i) {
        final active = i == current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 8,
          width: active ? 22 : 8,
          decoration: BoxDecoration(
            color: active ? Theme.of(context).colorScheme.primary : Colors.black12,
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }),
    );
  }
}
