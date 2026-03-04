import 'package:flutter/material.dart';

enum GenderCategory { homme, femme }
enum AgeCategory { enfant, jeune, adulte, senior }

class ServiceModel {
  final String id;
  String name;
  double price;
  String imageUrl;
  GenderCategory gender;
  AgeCategory age;

  ServiceModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.gender,
    required this.age,
  });
}

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<ServiceModel> _services = [
    ServiceModel(
      id: "1",
      name: "Coupe Garçon",
      price: 500,
      imageUrl: "assets/images/téléchargement (3).jpg",
      gender: GenderCategory.homme,
      age: AgeCategory.enfant,
    ),

    ServiceModel(
      id: "2",
      name: "Coupe Garçon",
      price: 500,
      imageUrl: "assets/images/téléchargement (4).jpg",
      gender: GenderCategory.homme,
      age: AgeCategory.enfant,
    ),

    ServiceModel(
      id: "3",
      name: "Rog",
      price: 1000,
      imageUrl: "assets/images/123 Likes, 2 Comments - Rog tha Barber….jpg",
      gender: GenderCategory.homme,
      age: AgeCategory.adulte,
    ),
    ServiceModel(
      id: "4",
      name: "Borc",
      price: 1000,
      imageUrl:"assets/images/Waves + Dégradé aux tempes + Bouc - Coiffures….jpg",
      gender: GenderCategory.homme,
      age: AgeCategory.adulte,
    ),
    ServiceModel(
      id: "5",
      name: "Americain",
      price: 700,
      imageUrl: "assets/images/Coiffure Homme Americain.jpg",
      gender: GenderCategory.homme,
      age: AgeCategory.jeune,
    ),
    ServiceModel(
      id: "6",
      name: "Dégradé à blanc",
      price: 750,
      imageUrl: "assets/images/Waves + Dégradé à blanc - Coiffures Homme Noir.jpg",
      gender: GenderCategory.homme,
      age: AgeCategory.jeune,
    ),
    ServiceModel(
      id: "7",
      name: "Brushing Femme",
      price: 1500,
      imageUrl: "assets/images/images.jpg",
      gender: GenderCategory.femme,
      age: AgeCategory.enfant,
    ),

    ServiceModel(
      id: "8",
      name: "Cool",
      price: 2000,
      imageUrl: "assets/images/téléchargement (6).jpg",
      gender: GenderCategory.femme,
      age: AgeCategory.adulte,
    ),

    ServiceModel(
      id: "9",
      name: "Fille",
      price: 3000,
      imageUrl: "assets/images/téléchargement (2).jpg",
      gender: GenderCategory.femme,
      age: AgeCategory.enfant,
    ),

    ServiceModel(
      id: "10",
      name: "Jolie",
      price: 1500,
      imageUrl: "assets/images/téléchargement (1).jpg",
      gender: GenderCategory.femme,
      age: AgeCategory.enfant,
    ),
    ServiceModel(
      id: "11",
      name: "Mi Long",
      price: 1500,
      imageUrl: "assets/images/Coiffer Cheveux Mi Long.jpg",
      gender: GenderCategory.femme,
      age: AgeCategory.senior,
    ),
    ServiceModel(
      id: "1200",
      name: "Belle",
      price: 15,
      imageUrl: "assets/images/téléchargement (5).jpg",
      gender: GenderCategory.femme,
      age: AgeCategory.senior,
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  void _deleteService(String id) {
    setState(() {
      _services.removeWhere((s) => s.id == id);
    });
  }

  void _showServiceDialog({ServiceModel? service}) {
    final nameCtrl = TextEditingController(text: service?.name ?? "");
    final priceCtrl =
    TextEditingController(text: service?.price.toString() ?? "");
    final imageCtrl =
    TextEditingController(text: service?.imageUrl ?? "");

    GenderCategory selectedGender =
        service?.gender ?? GenderCategory.homme;
    AgeCategory selectedAge =
        service?.age ?? AgeCategory.adulte;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius:
        BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (_) => StatefulBuilder(
        builder: (context, setModalState) => Padding(
          padding: EdgeInsets.only(
              bottom:
              MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    service == null
                        ? "Ajouter Service"
                        : "Modifier Service",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: nameCtrl,
                    decoration: const InputDecoration(
                        labelText: "Nom du service"),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: priceCtrl,
                    keyboardType:
                    TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Prix (FCFA)"),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: imageCtrl,
                    decoration: const InputDecoration(
                        labelText: "Image URL"),
                  ),
                  const SizedBox(height: 15),

                  DropdownButtonFormField(
                    value: selectedGender,
                    items: GenderCategory.values
                        .map((g) => DropdownMenuItem(
                      value: g,
                      child: Text(g
                          .name
                          .toUpperCase()),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setModalState(() {
                        selectedGender = value!;
                      });
                    },
                    decoration:
                    const InputDecoration(
                        labelText: "Genre"),
                  ),

                  const SizedBox(height: 15),

                  DropdownButtonFormField(
                    value: selectedAge,
                    items: AgeCategory.values
                        .map((a) => DropdownMenuItem(
                      value: a,
                      child:
                      Text(a.name),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setModalState(() {
                        selectedAge = value!;
                      });
                    },
                    decoration:
                    const InputDecoration(
                        labelText: "Catégorie d'âge"),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                      const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      final name = nameCtrl.text;
                      final price =
                          double.tryParse(
                              priceCtrl.text) ??
                              0;

                      setState(() {
                        if (service == null) {
                          _services.add(
                              ServiceModel(
                                id: DateTime.now()
                                    .toString(),
                                name: name,
                                price: price,
                                imageUrl:
                                imageCtrl.text,
                                gender:
                                selectedGender,
                                age: selectedAge,
                              ));
                        } else {
                          service.name = name;
                          service.price = price;
                          service.imageUrl =
                              imageCtrl.text;
                          service.gender =
                              selectedGender;
                          service.age =
                              selectedAge;
                        }
                      });

                      Navigator.pop(context);
                    },
                    child: const Text("Enregistrer"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildServiceSection(
      GenderCategory gender) {
    final genderServices = _services
        .where((s) => s.gender == gender)
        .toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: AgeCategory.values.map((age) {
        final ageServices =
        genderServices
            .where((s) => s.age == age)
            .toList();

        if (ageServices.isEmpty) {
          return const SizedBox();
        }

        return Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              age.name.toUpperCase(),
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight:
                  FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...ageServices.map(
                    (service) =>
                    _buildCard(service)),
            const SizedBox(height: 20),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildCard(ServiceModel service) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius:
          BorderRadius.circular(10),
          child: Image.network(
            service.imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(service.name),
        subtitle:
        Text("${service.price} FCFA"),
        trailing: PopupMenuButton(
          onSelected: (value) {
            if (value == 'edit') {
              _showServiceDialog(
                  service: service);
            } else {
              _deleteService(
                  service.id);
            }
          },
          itemBuilder: (_) => const [
            PopupMenuItem(
                value: 'edit',
                child: Text("Modifier")),
            PopupMenuItem(
                value: 'delete',
                child: Text("Supprimer")),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        const Text("Gestion des Services"),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Homme"),
            Tab(text: "Femme"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildServiceSection(
              GenderCategory.homme),
          _buildServiceSection(
              GenderCategory.femme),
        ],
      ),
      floatingActionButton:
      FloatingActionButton(
        onPressed: () =>
            _showServiceDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}