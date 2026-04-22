import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Pour formater les dates
import 'package:isabarder/constants/colors.dart';
import 'Service.dart';

class PriseRendezVous extends StatefulWidget {
  final ServiceList?
  selectedService; // Optionnel : si l'utilisateur vient depuis un service spécifique
  final double? servicePrix;

  const PriseRendezVous({super.key, this.servicePrix, this.selectedService});

  @override
  State<PriseRendezVous> createState() => _PriseRendezVousState();
}

class _PriseRendezVousState extends State<PriseRendezVous> {
  // Sélections

  String? selectedServiceNom;
  String? selectedServicePrix;
  String? selectedCoiffeur;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedHeure;

  // Données

  final List<Coiffeur> coiffeurs = [
    Coiffeur(
      "Karim",
      "Spécialiste coupe homme",
      4.9,
      156,
      "assets/images/barber1.png",
    ),
    Coiffeur("Ahmed", "Expert barbe", 4.8, 98, "assets/images/barber2.png"),
    Coiffeur("Sami", "Coloriste", 4.9, 203, "assets/images/barber3.png"),
    Coiffeur("Youssef", "Tous styles", 4.7, 87, "assets/images/barber4.png"),
  ];

  final List<String> heuresDispo = [
    "09:00",
    "09:30",
    "10:00",
    "10:30",
    "11:00",
    "11:30",
    "13:00",
    "13:30",
    "14:00",
    "14:30",
    "15:00",
    "15:30",
    "16:00",
    "16:30",
    "17:00",
    "17:30",
  ];

  @override
  void initState() {
    super.initState();
    if (widget.selectedService != null) {
      selectedServiceNom = widget.selectedService!.title;
      selectedServicePrix = widget.selectedService!.price;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.selectedService != null)
                    _buildSelectedService()
                  else
                    _buildServiceSection(),
                  const SizedBox(height: 24),
                  _buildCoiffeurSection(),
                  const SizedBox(height: 24),
                  _buildDateSection(),
                  const SizedBox(height: 24),
                  _buildHeureSection(),
                  const SizedBox(height: 32),
                  _buildResumeSection(),
                  const SizedBox(height: 24),
                  _buildBoutonReservation(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      title: const Text(
        "Nouveau rendez-vous",
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.help_outline, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [tdblueWithopacity, tdmarron],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Prenez rendez-vous",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Choisissez votre service, coiffeur et horaire",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedService() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "💇‍♂️ Service sélectionné",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: tdblueWithopacity.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: tdblueWithopacity),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.selectedService!.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.selectedService!.duration,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
              Text(
                "${widget.selectedService!.price} FCFA",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: tdblueWithopacity,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildServiceSection() {
    // Utilise ta liste de ServiceList (celle avec image, title, price, etc.)
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
        description: "Soin visage complet",
        duration: "1h",
        rating: 4.7,
        reviews: 95,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "💇‍♂️ Service",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              final isSelected = selectedServiceNom == service.title;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedServiceNom = service.title;
                    selectedServicePrix = service.price;
                  });
                },
                child: Container(
                  width: 160,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? tdblueWithopacity : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? tdblueWithopacity : Colors.grey[200]!,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                        child: Image.asset(
                          service.image,
                          height: 70,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 70,
                              color: Colors.grey[200],
                              child: const Icon(
                                Icons.image,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                Text(
                                  "${service.price} FCFA",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: isSelected
                                        ? Colors.white70
                                        : tdblueWithopacity,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      service.rating.toString(),
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: isSelected
                                            ? Colors.white70
                                            : Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCoiffeurSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "✂️ Choisissez votre coiffeur",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: coiffeurs.length,
            itemBuilder: (context, index) {
              final coiffeur = coiffeurs[index];
              final isSelected = selectedCoiffeur == coiffeur.nom;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCoiffeur = coiffeur.nom;
                  });
                },
                child: Container(
                  width: 140,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: isSelected ? tdblueWithopacity : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? tdblueWithopacity : Colors.grey[200]!,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: isSelected
                            ? Colors.white24
                            : Colors.grey[200],
                        backgroundImage: coiffeur.image != null
                            ? AssetImage(coiffeur.image!)
                            : null,
                        child: coiffeur.image == null
                            ? Icon(
                                Icons.person,
                                color: isSelected ? Colors.white : Colors.grey,
                              )
                            : null,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        coiffeur.nom,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.star, size: 12, color: Colors.amber),
                          const SizedBox(width: 2),
                          Text(
                            coiffeur.note.toString(),
                            style: TextStyle(
                              fontSize: 11,
                              color: isSelected
                                  ? Colors.white70
                                  : Colors.grey[600],
                            ),
                          ),
                          Text(
                            " (${coiffeur.avis})",
                            style: TextStyle(
                              fontSize: 10,
                              color: isSelected
                                  ? Colors.white54
                                  : Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDateSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "📅 Date",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: InkWell(
            onTap: _selectionnerDate,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: tdblueWithopacity),
                    const SizedBox(width: 12),
                    Text(
                      selectedDate != null
                          ? DateFormat(
                              'EEEE d MMMM yyyy',
                              'fr',
                            ).format(selectedDate!)
                          : "Choisir une date",
                      style: TextStyle(
                        fontSize: 16,
                        color: selectedDate != null
                            ? Colors.black87
                            : Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeureSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "⏰ Heure",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: heuresDispo.map((heure) {
            final isSelected = selectedHeure == heure;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedHeure = heure;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? tdblueWithopacity : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: isSelected ? tdblueWithopacity : Colors.grey[200]!,
                  ),
                ),
                child: Text(
                  heure,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildResumeSection() {
    if (selectedServiceNom == null &&
        selectedCoiffeur == null &&
        selectedDate == null &&
        selectedHeure == null) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "📋 Récapitulatif",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          if (selectedServiceNom != null) ...[
            _buildResumeItem(Icons.content_cut, "Service", selectedServiceNom!),
            const SizedBox(height: 8),
          ],
          if (selectedCoiffeur != null) ...[
            _buildResumeItem(Icons.person, "Coiffeur", selectedCoiffeur!),
            const SizedBox(height: 8),
          ],
          if (selectedDate != null) ...[
            _buildResumeItem(
              Icons.calendar_today,
              "Date",
              DateFormat('dd/MM/yyyy', 'fr').format(selectedDate!),
            ),
            const SizedBox(height: 8),
          ],
          if (selectedHeure != null) ...[
            _buildResumeItem(Icons.access_time, "Heure", selectedHeure!),
          ],
        ],
      ),
    );
  }

  Widget _buildResumeItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 18, color: tdblueWithopacity),
        const SizedBox(width: 12),
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          ),
        ),
      ],
    );
  }

  Widget _buildBoutonReservation() {
    final bool isComplete =
        selectedServiceNom != null &&
        selectedCoiffeur != null &&
        selectedDate != null &&
        selectedHeure != null;

    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: isComplete ? _confirmerReservation : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: tdblueWithopacity,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: Text(
          isComplete
              ? "CONFIRMER MON RENDEZ-VOUS"
              : "COMPLÉTEZ LES INFORMATIONS",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Future<void> _selectionnerDate() async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now.add(const Duration(days: 1)),
      firstDate: now,
      lastDate: now.add(const Duration(days: 30)),
      locale: const Locale('fr', 'FR'),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _confirmerReservation() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Column(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 50),
            SizedBox(height: 10),
            Text("Rendez-vous confirmé !"),
          ],
        ),
        content: Text(
          "Votre rendez-vous pour $selectedServiceNom avec $selectedCoiffeur le ${DateFormat('dd/MM/yyyy', 'fr').format(selectedDate!)} à $selectedHeure a bien été enregistré.",
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // Retour à l'accueil
            },
            child: const Text("OK", style: TextStyle(color: tdblueWithopacity)),
          ),
        ],
      ),
    );
  }
}

// Modèles

class Coiffeur {
  final String nom;
  final String specialite;
  final double note;
  final int avis;
  final String? image;

  Coiffeur(this.nom, this.specialite, this.note, this.avis, this.image);
}
