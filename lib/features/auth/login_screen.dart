import 'package:flutter/material.dart';

import '../../widgets/role_selector.dart';

// Définir les roles
enum UserRole { customer, hairdresser, manager }

// Créer la classe pour l’écran de login
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  UserRole _role = UserRole.customer;

  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }
  void _login() {
    final email = _emailCtrl.text.trim();
    final password = _passCtrl.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email et mot de passe requis")),
      );
      return;
    }

    // Redirection selon le profil choisi
    final route = switch(_role) {
      UserRole.customer => '/home-customer',
      UserRole.hairdresser => '/home-hairdresser',
      UserRole.manager => '/home-manager',
    };

    Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFF6F6F8),
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
                    padding: const EdgeInsets.all(18),
                    child: Container(
                        constraints: const BoxConstraints(maxWidth: 420),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 18,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                            const SizedBox(height: 6),
                        Center(
                          child: Container(
                            width: 64,
                            height: 64,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [Color(0xFF8A2BE2), Color(0xFFFF3D8D)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: const Icon(
                              Icons.content_cut,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      const SizedBox(height: 14),
                      Text(
                        "ISA Barber",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Welcome back! Please login to continue",
                        textAlign: TextAlign.center,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.black54),
                      ),
                      const SizedBox(height: 18),

                      Text(
                        "Select Profile",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Row(
                        children: [
                      Expanded(
                      child: RoleButton(
                      selected: _role == UserRole.customer,
                        icon: Icons.person_outline,
                        label: "Customer",
                        onTap: () =>
                            setState(() => _role = UserRole.customer),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RoleButton(
                        selected: _role == UserRole.hairdresser,
                        icon: Icons.content_cut,
                        label: "Hairdresser",
                        onTap: () =>
                            setState(() => _role = UserRole.hairdresser),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RoleButton(
                        selected: _role == UserRole.manager,
                        icon: Icons.lock_outline,
                        label: "Manager",
                        onTap: () => setState(() => _role = UserRole.manager),
                      ),
                    ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      Text(
                        "Email",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "you@example.com",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 14),

                      Text(
                        "Password",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _passCtrl,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),
                              // Gradient login button
                              GestureDetector(
                                onTap: _login,
                                child: Container(
                                  height: 52,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF8A2BE2), Color(0xFFFF3D8D)],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 14),
                              Text(
                                "Demo app - Click login to continue",
                                textAlign: TextAlign.center,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.copyWith(color: Colors.black54),
                              ),
                            ],
                        ),
                    ),
                ),
            ),
        ),
    );
  }
}