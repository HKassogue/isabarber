import 'package:flutter/material.dart';
import 'package:isabarder/constants/colors.dart';
import 'package:isabarder/pages/PriseRendezVous.dart';

class ServiceList {
  final String image;
  final String title;
  final String price;
  final String description;
  final String
  duration; // J'ai changé "date" en "duration" car c'est plus logique
  final double rating;
  final int reviews;

  ServiceList({
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.duration,
    this.rating = 4.5,
    this.reviews = 100,
  });
}

class Service extends StatelessWidget {
  Service({super.key});

  final List<ServiceList> services = [
    ServiceList(
      image: "assets/images/barber1.png",
      title: "Coupe Classique",
      price: "5000",
      description: "Coupe homme avec shampoing et coiffage",
      duration: "45 min",
      rating: 4.8,
      reviews: 120,
    ),
    ServiceList(
      image: "assets/images/barber2.png",
      title: "Taille de Barbe",
      price: "3000",
      description: "Taille de barbe au ciseau + soin",
      duration: "30 min",
      rating: 4.6,
      reviews: 85,
    ),
    ServiceList(
      image: "assets/images/barber3.png",
      title: "Coupe + Barbe",
      price: "7500",
      description: "Pack complet coupe + barbe avec soin",
      duration: "1h 15min",
      rating: 4.9,
      reviews: 200,
    ),
    ServiceList(
      image: "assets/images/soin.jpg",
      title: "Soin Vissage",
      price: "7500",
      description: "Pack complet coupe + barbe avec soin",
      duration: "1h 15min",
      rating: 4.9,
      reviews: 200,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // En-tête avec nombre de services
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 16),
              child: Text(
                "${services.length} services disponibles",
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ),

            // Liste des services
            ...services.map((item) => _buildServiceCard(item)).toList(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: tdblueWithopacity,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      title: const Text(
        "Nos Services",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildServiceCard(ServiceList service) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image du service
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.grey[200],
              child: service.image.isNotEmpty
                  ? Image.asset(
                      service.image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.content_cut,
                          size: 40,
                          color: Colors.grey,
                        );
                      },
                    )
                  : const Icon(Icons.image, color: Colors.grey),
            ),
          ),

          const SizedBox(width: 15),

          // Détails du service
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Titre et prix
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        service.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: tdblueWithopacity.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "${service.price} FCFA",
                        style: TextStyle(
                          color: tdblueWithopacity,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Description
                Text(
                  service.description,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 10),

                // Durée et rating
                Row(
                  children: [
                    // Durée
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: Colors.grey[700],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            service.duration,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10),

                    // Rating
                    Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Colors.amber),
                        const SizedBox(width: 2),
                        Text(
                          service.rating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          " (${service.reviews})",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // Bouton BOOK NOW
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: Builder(
                    builder: (context) {
                      return ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (__) =>
                                  PriseRendezVous(selectedService: service),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: tdblueWithopacity,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          "RÉSERVER",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      );
                    },
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
