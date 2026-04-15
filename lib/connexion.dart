import 'package:flutter/material.dart';
import 'package:isabarder/BottonNavigation.dart';

import 'package:isabarder/LoginPage.dart';
import 'package:isabarder/WelcomePage.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool _isLoading = false;
  bool _isPasswordVissible = false;
  final Color _primaryColor = Color(0xff4f46e5);
  final Color _darkTextColor = Color(0xff0f172a);
  final Color _bodyTextColor = Color(0xff475569);
  final Color _borderColor = Color(0xff2e8f0);
  final Color _bgLight = Color(0xfff8fafc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgLight,
      /* appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, size: 22 , color: Colors.blueGrey,)),
      ),*/
      body: Stack(
        children: [
          _Backgrounddecoration(color: _primaryColor),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      children: [
                        _loginHeader(
                          darkColor: _darkTextColor,
                          bodyColor: _bodyTextColor,
                        ),
                        _LoginFormFilds(
                          primaryColor: _primaryColor,
                          bodyColor: _bodyTextColor,
                          borderColor: _bodyTextColor,
                          darkColor: _darkTextColor,
                          isShoPasswordVisible: false,
                        ),
                        SizedBox(height: 30),
                        _loginButton(btnColor: _primaryColor),
                        SizedBox(height: 15),
                        _SocialLOginSection(
                          bodyColor: _bodyTextColor,
                          darkColor: _darkTextColor,
                          borderColor: _bodyTextColor,
                        ),
                        SizedBox(height: 15),
                        _footerSection(
                          primaryColor: _primaryColor,
                          bodyColor: _bodyTextColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// widget box shape circular
class _Backgrounddecoration extends StatelessWidget {
  final Color color;

  const _Backgrounddecoration({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: -60,
          right: -60,
          child: _blob(280, color.withOpacity(0.08)),
        ),

        Positioned(
          top: -60,
          left: -60,
          child: _blob(230, color.withOpacity(0.12)),
        ),
      ],
    );
  }

  Widget _blob(double size, Color color) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(shape: BoxShape.circle, color: color),
  );
}

//Header Text
class _loginHeader extends StatelessWidget {
  final Color darkColor, bodyColor;

  const _loginHeader({
    super.key,
    required this.darkColor,
    required this.bodyColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 70),
        Text(
          "Bienvenue",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w800,
            color: darkColor,
            letterSpacing: -0.5,
          ),
        ),
        Text(
          "Entrez vos informations pour acceder a votre compte",
          style: TextStyle(fontSize: 16, color: bodyColor, height: 1.5),
        ),
      ],
    );
  }
}

//FormField
class _LoginFormFilds extends StatelessWidget {
  final Color primaryColor, bodyColor, borderColor, darkColor;
  final bool isShoPasswordVisible;

  const _LoginFormFilds({
    super.key,
    required this.primaryColor,
    required this.bodyColor,
    required this.borderColor,
    required this.darkColor,
    required this.isShoPasswordVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40),
        _label("Adresse Email"),
        _inputField(Icons.mail, "Entrez votre email"),
        SizedBox(height: 24),
        _label("Mot De Passe"),
        _inputField(
          Icons.lock_open_rounded,
          "Entrez votre Mot de passe",
          isPassword: true,
          suffix: IconButton(
            onPressed: () {},
            icon: Icon(
              isShoPasswordVisible
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
              size: 20,
              color: bodyColor,
            ),
          ),
        ),
      ],
    );
  }

  //label widget
  Widget _label(String text) => Padding(
    padding: const EdgeInsetsGeometry.only(left: 4, bottom: 12),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: darkColor.withOpacity(0.8),
        letterSpacing: 1.2,
      ),
    ),
  );

  //input widget
  Widget _inputField(
    IconData icon,
    String hint, {
    bool isPassword = false,
    Widget? suffix,
  }) {
    return Container(
      child: TextField(
        obscureText: isPassword && !isShoPasswordVisible,
        style: TextStyle(color: darkColor, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: bodyColor.withOpacity(0.4), fontSize: 16),
          prefixIcon: Icon(icon, color: primaryColor, size: 27),
          suffixIcon: suffix,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: darkColor.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );
  }
}

class _loginButton extends StatelessWidget {
  final Color btnColor;

  const _loginButton({super.key, required this.btnColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Bottonnavigation()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          "CONNEXION",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

//social  login

class _SocialLOginSection extends StatelessWidget {
  final Color bodyColor, darkColor, borderColor;

  const _SocialLOginSection({
    super.key,
    required this.bodyColor,
    required this.darkColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            "Ou Continuer avec",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: darkColor.withOpacity(0.4),
            ),
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            _tile("Google", null, icon: Icons.mail),
            _tile("Apple", null, icon: Icons.apple),
          ],
        ),
      ],
    );
  }

  Widget _tile(String label, String? imageUrl, {IconData? icon}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        margin: EdgeInsets.symmetric(horizontal: 5),
        height: 58,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: bodyColor, width: 1.5),
        ),
        child: Row(
          children: [
            if (imageUrl != null)
              Image.network(imageUrl, height: 18)
            else
              Icon(icon, size: 22, color: darkColor),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

class _footerSection extends StatelessWidget {
  final Color primaryColor, bodyColor;

  const _footerSection({
    super.key,
    required this.primaryColor,
    required this.bodyColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Vous etes Nouveau ?", style: TextStyle(color: bodyColor)),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Loginpage()),
            );
          },
          child: Text(
            "Creer un Compte",
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}
