import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:isabarder/connexion.dart';
import 'package:isabarder/pages/loading_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Carousel Slider",
      home: LoadingPage(),

      // ✅ AJOUTE CES LIGNES ICI (c'est ce qui manquait !)
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fr', 'FR'), // Français
        Locale('en', 'US'), // Anglais (fallback)
      ],
    );
  }
}

// Le reste de ton code (CarouselExemple, etc.) reste identique
class CarouselExemple extends StatefulWidget {
  CarouselExemple({super.key});

  @override
  State<CarouselExemple> createState() => _CarouselExempleState();
}

class _CarouselExempleState extends State<CarouselExemple> {
  List<String> Images = [
    'assets/images/barber1.png',
    'assets/images/barber2.png',
    'assets/images/barber3.png',
    'assets/images/barber4.png',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            items: Images.map(
              (toElement) => Container(
                width: double.infinity,
                margin: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(toElement),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ).toList(),
            options: CarouselOptions(
              height: 250,
              viewportFraction: 1.0,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(microseconds: 800),
              enlargeCenterPage: true,
              aspectRatio: 16 / 9,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...Images.asMap().entries
                  .map(
                    (item) => Container(
                      height: 7,
                      width: 7,
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == item.key
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                    ),
                  )
                  .toList(),
            ],
          ),
          const SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Welcome()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
