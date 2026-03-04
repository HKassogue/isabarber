import 'package:flutter/material.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'features/auth/login_screen.dart';
import 'features/home/customer_home_screen.dart';
import 'features/home/hairdresser_home_screen.dart';
import 'features/home/manager_home_screen.dart';
import 'widgets/not_ready_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ISA Barber',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: '/',
      routes: {
        '/': (_) => const OnboardingScreen(),
        '/login': (_) => const LoginScreen(),
        '/home-customer': (_) => const CustomerHomeScreen(),
        '/home-hairdresser': (_) => const HairdresserHomeScreen(),
        '/home-manager': (_) => const ManagerHomeScreen(),
        '/placeholder': (_) => const NotReadyScreen(title: "Placeholder"),
      },
    );
  }
}