import 'package:flutter/material.dart';
import 'package:isabarder/Color.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: bgLight,
    body: Stack(
      children: [
        _BackGrounddecoration(color: primaryColor),
       SafeArea(

           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
           Expanded(child: SingleChildScrollView(
             padding:const EdgeInsets.symmetric(horizontal: 28),
             child: Column(
             children: [
               _Header(darkTextColor: darkTextColor),
               _SignFields(primaryColor: primaryColor, bodyColor: bodyTextColor, borderColor: borderColor, darkColor: darkTextColor, isShoPasswordVisible: false)
             ],
           ),))
         ],
       ))
      ],
    ),
    );
  }
}


class _BackGrounddecoration extends StatelessWidget {
  final Color color;
  const _BackGrounddecoration({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        Positioned(
            top: -60,
            left: -60,
            child: _bolb(280, color.withOpacity(0.08))),
    Positioned(
        bottom: -60,
        right: -60,
        child: _bolb(230, color.withOpacity(0.12)))
      ],
    );
  }
  
  Widget _bolb(double size , Color color)=>Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      shape: BoxShape.circle, color: color
    ),
  );
}

class _Header extends StatelessWidget {
  final Color darkTextColor;
  const _Header({super.key, required this.darkTextColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Aligné à gauche, c'est plus "Dashboard"
      children: [
        const SizedBox(height: 40),
        // Petit badge "Cyber" pour rassurer l'utilisateur

        const SizedBox(height: 24),
        Text("Créer un compte",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 34, color: darkTextColor, fontWeight: FontWeight.w900, letterSpacing: -1)),
        const SizedBox(height: 8),
        Text("Vos données sont chiffrées et sécurisées",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: darkTextColor.withOpacity(0.6), fontWeight: FontWeight.w500)),
      ],
    );
  }
}


//formullaire

class _SignFields extends StatelessWidget {
  final Color primaryColor , bodyColor , borderColor , darkColor;
  final bool isShoPasswordVisible;
  const _SignFields({super.key, required this.primaryColor, required this.bodyColor, required this.borderColor, required this.darkColor, required this.isShoPasswordVisible});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        _label("Nom"),
        _InputFormField(Icons.person, "Entrez votre nom complet"),
        SizedBox(height: 15,),
        _label("Numero"),
        _InputFormField(Icons.phone_android, "+223 90405200"),
        SizedBox(height: 15,),
        _label("Email"),
        _InputFormField(Icons.mail, "kmma.960@gmail.com"),
        SizedBox(height: 15,),
        _label("Password"),
        _InputFormField(Icons.lock_open_rounded, "......"),
        SizedBox(height: 15,),
        _label("Confirm"),
        _InputFormField(Icons.lock_open_rounded, "......")
      ],
    );
  }

  Widget _label(String text)=>Padding(padding: const EdgeInsetsGeometry.only(left: 12 ,bottom: 4), child: Text(text , style: TextStyle(color: darkColor.withOpacity(0.8) , fontWeight: FontWeight.w600 , fontSize: 16 , letterSpacing: -0.2),),);

  Widget _InputFormField (
      IconData icon,
      String hint,
    {
      bool isPassword = false,
      Widget ? suffix
    }
      )

  {
    return Container(
      child: TextField(
        obscureText: isPassword && ! isShoPasswordVisible,
        style: TextStyle(color: darkColor , fontWeight: FontWeight.w500),
        decoration: InputDecoration(
         hintText: hint,
          hintStyle: TextStyle(color: darkColor.withOpacity(0.6 ) , fontWeight: FontWeight.w300, fontSize: 15),
          prefixIcon: Icon(icon , color: primaryColor,size: 27,),
          suffixIcon: suffix,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18)
        ),
      ),
      decoration: BoxDecoration(
color: Colors.white,
        borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor , width: 1.2),
        boxShadow: [
          BoxShadow(
              color: darkColor.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4)

          )
        ]
      ),
    );
  }

  //input

}

