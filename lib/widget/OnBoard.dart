import 'package:flutter/material.dart';


class Onboard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String image;

  const Onboard({super.key, required this.title, required this.subTitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Positioned.fill(

            child: Image.asset(
                image,
              fit: BoxFit.cover,
            )
        ),
        Positioned.fill(
            child:Container(

              color: Colors.black.withOpacity(0.4),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text(title , textAlign: TextAlign.center,style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 3,),
                  Text(subTitle ,textAlign: TextAlign.center,  style: TextStyle(

                    color: Colors.white,
                    fontSize: 20,

                  ),),
                ],
              ),
            )
        )

      ],
    );
  }
}
