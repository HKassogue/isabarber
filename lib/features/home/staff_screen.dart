import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen({super.key});

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int selectedIndex = 0;

  final List<Map<String, dynamic>> barbers = [
    {
      "firstName": "Moussa",
      "lastName": "Diallo",
      "phone": "77000000",
      "specialty": "Coupe Homme",
      "blocked": false,
      "daily": [12000, 15000, 10000, 18000, 20000, 17000, 22000],
      "weekly": [95000, 120000, 110000, 140000],
      "monthly": [400000, 520000, 480000, 600000]
    },
    {
      "firstName": "Ibrahim",
      "lastName": "Traoré",
      "phone": "77111111",
      "specialty": "Coupe Femme",
      "blocked": false,
      "daily": [10000, 13000, 9000, 15000, 18000, 16000, 19000],
      "weekly": [85000, 100000, 95000, 120000],
      "monthly": [350000, 470000, 430000, 520000]
    }
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  double getTotal(List<double> data) {
    return data.reduce((a, b) => a + b);
  }

  void _addBarber() {
    final firstNameCtrl = TextEditingController();
    final lastNameCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final specialtyCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Ajouter un Coiffeur"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: firstNameCtrl,
                decoration: const InputDecoration(labelText: "Prénom"),
              ),
              TextField(
                controller: lastNameCtrl,
                decoration: const InputDecoration(labelText: "Nom"),
              ),
              TextField(
                controller: phoneCtrl,
                decoration: const InputDecoration(labelText: "Téléphone"),
              ),
              TextField(
                controller: specialtyCtrl,
                decoration: const InputDecoration(labelText: "Spécialité"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Annuler"),
          ),
          ElevatedButton(
            onPressed: () {
              if (firstNameCtrl.text.isEmpty ||
                  lastNameCtrl.text.isEmpty ||
                  phoneCtrl.text.isEmpty ||
                  specialtyCtrl.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Tous les champs doivent être remplis")),
                );
                return;
              }

              setState(() {
                barbers.add({
                  "firstName": firstNameCtrl.text,
                  "lastName": lastNameCtrl.text,
                  "phone": phoneCtrl.text,
                  "specialty": specialtyCtrl.text,
                  "blocked": false,
                  "daily": List.filled(7, 0),
                  "weekly": List.filled(4, 0),
                  "monthly": List.filled(4, 0),
                });
              });
              Navigator.pop(context);
            },
            child: const Text("Ajouter"),
          )
        ],
      ),
    );
  }

  void _toggleBlock(int index) {
    setState(() {
      barbers[index]["blocked"] = !barbers[index]["blocked"];
    });
  }

  void _deleteBarber(int index) {
    setState(() {
      barbers.removeAt(index);
      if (selectedIndex >= barbers.length) selectedIndex = barbers.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentBarber = barbers.isNotEmpty ? barbers[selectedIndex] : null;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Gestion du Staff"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _addBarber,
            icon: const Icon(Icons.person_add),
            tooltip: "Ajouter un coiffeur",
          )
        ],
        bottom: currentBarber != null
            ? TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Jour"),
            Tab(text: "Semaine"),
            Tab(text: "Mois"),
          ],
        )
            : null,
      ),
      body: Column(
        children: [
          // Liste coiffeurs
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: barbers.length,
              itemBuilder: (context, index) {
                final barber = barbers[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    width: 150,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: selectedIndex == index ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 5,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${barber["firstName"]} ${barber["lastName"]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                barber["blocked"]
                                    ? Icons.lock
                                    : Icons.lock_open,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.grey,
                              ),
                              onPressed: () => _toggleBlock(index),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.red),
                              onPressed: () => _deleteBarber(index),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Stats
          Expanded(
            child: currentBarber != null
                ? TabBarView(
              controller: _tabController,
              children: [
                buildStats(currentBarber["daily"], "Journalier"),
                buildStats(currentBarber["weekly"], "Hebdomadaire"),
                buildStats(currentBarber["monthly"], "Mensuel"),
              ],
            )
                : const Center(
              child: Text("Aucun coiffeur disponible"),
            ),
          )
        ],
      ),
    );
  }

  Widget buildStats(List<dynamic> rawData, String label) {
    List<double> data =
    rawData.map((e) => (e as num).toDouble()).toList();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            elevation: 6,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Chiffre d'affaires $label",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${getTotal(data).toStringAsFixed(0)} FCFA",
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Card(
              elevation: 6,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: data
                            .asMap()
                            .entries
                            .map((e) => FlSpot(e.key.toDouble(), e.value))
                            .toList(),
                        isCurved: true,
                        barWidth: 4,
                        belowBarData: BarAreaData(show: true),
                      )
                    ],
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