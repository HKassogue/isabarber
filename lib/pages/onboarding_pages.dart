import 'package:flutter/material.dart';

import 'package:isabarder/connexion.dart';
import 'package:isabarder/widget/OnBoard.dart';
class OnboardingPages extends StatefulWidget {
  const OnboardingPages({super.key});

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}
  int currentIndex = 0;
class _OnboardingPagesState extends State<OnboardingPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
    backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: EdgeInsets.only(left: 2),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), // 👈 8px d'arrondi (au lieu de 50)
          ),
          child: ClipRRect( // 👈 Important pour appliquer l'arrondi à l'image
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
                fit: BoxFit.cover,
                "assets/logo_symbole/logo_barber.jpeg"
            ),
          ),
        ),

        //actions buttons
        actions: [
          TextButton(onPressed: (){}, child: Text("SIGN IN" , style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18
          ),))
        ],

      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            children: [
              Onboard(
                  title: "Réservez en 2 minutes",
                  subTitle: "Choisissez une prestation, un coiffeur et un créneau disponible.",
                  image: "assets/images/onb3.png"
              ),

              Onboard(
                  title: "La Coupe Parfaite",
                  subTitle: "Du fade au dégradé, on maîtrise toutes les techniques.",
                  image: "assets/images/onb1.png"
              ),

              Onboard(
                  title: "Le Soin Complet",
                  subTitle: "Coupe, barbe, rasage : tout pour être impeccable.",
                  image: "assets/images/onb2.png"
              ),

            ],
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          Padding(
              padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    ...List.generate(
                        3,
                        (index) =>AnimatedContainer(duration: const Duration(microseconds: 300),
                        margin: const EdgeInsets.only(right: 5),
                        height: 10,
                          width: currentIndex == index  ? 20 : 10,
                          decoration: BoxDecoration(
                            color: currentIndex == index ? Colors.red : Colors.white,
                            borderRadius: BorderRadius.circular(5)

                          ),

                        )
                    )
                    ,

                  ],

                ),
                SizedBox(height: 5,),
                Container(
                  width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> Welcome(),


                      ));
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    )

                        , child: Text("Get Startted" , style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800
                        ),)
                    )
                )
              ],
            ),
          
          )
        ],
      ),
    );
  }
}
