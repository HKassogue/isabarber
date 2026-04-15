import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:isabarder/BottonNavigation.dart';
import 'package:isabarder/constants/colors.dart';

class ActivityCard {
  final String title;
  final String discount;
  final String description;
  final String duration;
  final Color color;
  final IconData icon;

  ActivityCard({
    required this.title,
    required this.discount,
    required this.description,
    required this.duration,
    required this.color,
    required this.icon,
  });
}

class ServicePopulair {
  final String image;
  final String title;
  final String description;
  final double rating;

  ServicePopulair({
    required this.image,
    required this.title,
    required this.description,
    required this.rating,
  });
}

class Welcomepage extends StatelessWidget {
  Welcomepage({super.key});

  final List<ActivityCard> activityCards = [
    ActivityCard(
      title: "Coupe Classique",
      discount: "-20%",
      description: "Coupe homme/femme avec shampooing",
      duration: "45 min",
      color: Color(0xFFFF6B6B),
      // Rouge corail
      icon: Icons.content_cut,
    ),
    ActivityCard(
      title: "Coloration",
      discount: "-15%",
      description: "Coloration naturelle + soin",
      duration: "90 min",
      color: Color(0xFF4ECDC4),
      // Turquoise
      icon: Icons.color_lens,
    ),
    ActivityCard(
      title: "Brushing",
      discount: "-25%",
      description: "Brushing professionnel",
      duration: "30 min",
      color: Color(0xFFFFB347),
      // Orange
      icon: Icons.air,
    ),
    ActivityCard(
      title: "Barbe",
      discount: "-10%",
      description: "Taille de barbe + soin",
      duration: "20 min",
      color: Color(0xFFA06B9A),
      // Violet
      icon: Icons.face,
    ),
  ];

  // liste de service
  final List<ServicePopular> popularServices = [
    ServicePopular(
      image: "assets/images/onb1.png",
      title: "Coupe classique",
      description: "Coupe au ciseau + shampoing",
      rating: 4.8,
    ),
    ServicePopular(
      image: "assets/images/barber2.png",
      title: "Taille de barbe",
      description: "Taille + soin après-rasage",
      rating: 4.7,
    ),
    ServicePopular(
      image: "assets/images/massage.png",
      title: "Coloration",
      description: "Coloration naturelle sans ammoniaque",
      rating: 4.9,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: tdWhite,
        appBar: _buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //     welcome container
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Text(
                  "Welcome , MARLEY 👋",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              // search box cntainer
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: tdGrey.withOpacity(0.2),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    prefixIcon: Icon(Icons.search, color: tdmarron, size: 25),

                    prefixIconConstraints: BoxConstraints(
                      maxHeight: 20,
                      maxWidth: 25,
                    ),
                    border: InputBorder.none,
                    hintText: "Search your model",
                    hintStyle: TextStyle(color: tdmarron),
                  ),
                ),
              ),

              CarouselSlider(
                items: activityCards
                    .map((toElement) => _buildActivityCard(toElement))
                    .toList(),
                options: CarouselOptions(
                  height: 250,
                  viewportFraction: 1.0,
                  autoPlay: false,
                ),
              ),
              //LISTES DES SERVICES DEROULANTES
              ServiceList(),
              // SERVICES POPULAIRES
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      " SERVICES POPULAIRES",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 230,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: popularServices.length,
                        itemBuilder: (context, index) {
                          return ServicePopular(
                            image: popularServices[index].image,
                            title: popularServices[index].title,
                            description: popularServices[index].description,
                            rating: popularServices[index].rating,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // botton navigationbar
      ),
    );
  }

  // appbar
  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: tdWhite,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/logo_symbole/logo_barber.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                "ISA BARBER",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ],
          ),

          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_outlined),
              ),

              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
    String title,
    String price,
    IconData icon,
    Color color,
    String imagePath,
  ) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(0.1),
            ),
            child: Icon(icon, color: color, size: 30),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            price,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}

//  carouel
Widget _buildActivityCard(ActivityCard card) {
  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: card.color,
      boxShadow: [
        BoxShadow(
          color: card.color.withOpacity(0.3),
          blurRadius: 15,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(card.icon, color: Colors.white, size: 24),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                card.discount,
                style: TextStyle(
                  color: card.color,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Text(
          card.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          card.description,
          style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 13),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Icon(
              Icons.access_time,
              size: 16,
              color: Colors.white.withOpacity(0.8),
            ),
            const SizedBox(width: 5),
            Text(
              card.duration,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// service section

class ServiceList extends StatefulWidget {
  const ServiceList({super.key});

  @override
  State<ServiceList> createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  List ServiceList = [
    {"title": "Coifffure", "image": "assets/images/barber1.png"},
    {"title": "Alassane", "image": "assets/images/barber2.png"},

    {"title": "Marley", "image": "assets/images/barber3.png"},

    {"title": "Bintou", "image": "assets/images/barber4.png"},

    {"title": "General", "image": "assets/images/massage.png"},

    {"title": "Maimouna", "image": "assets/images/voile.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "SERVICES - CATEGORIE",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: tdBlack,
              ),
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ServiceList.map((toElement) {
                return Column(
                  children: [
                    Container(
                      width: 95,
                      height: 95,
                      decoration: BoxDecoration(
                        color: tdRed.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(left: 10),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(toElement["image"]),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      toElement["title"],
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// section servic populaire
class ServicePopular extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final double rating;

  const ServicePopular({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.star, size: 14, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
