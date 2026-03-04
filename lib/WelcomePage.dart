import 'package:flutter/material.dart';
import 'package:isabarder/BottonNavigation.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            // AppBar moderne et épurée

            SliverAppBar(
              expandedHeight: 120,
              elevation: 0,
              floating: true,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF667eea), Color(0xFF764ba2)],)
                    ),
                    child: SafeArea(child: Padding(padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Bonjour 👋",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              const Text(
                                "Marley Dev",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],

                          ),

                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white.withOpacity(0.2)
                            ),
                            child: IconButton(onPressed: () {},
                                icon: Icon(Icons.notifications_outlined,
                                  color: Colors.white,)),
                          )
                        ],
                      ),
                    ),)
                ),
              ),
            ),
            // Bannière principale avec effet de carte

            SliverToBoxAdapter(
                child: Padding(padding: EdgeInsets.all(20),
                  child: Container(
                    height: 180,

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [Color(0xFFFF6B6B), Color(0xFF4ECDC4)],)
                    ),

                    child: Stack(
                      children: [
                        Positioned(
                            right: -20,
                            bottom: -20,
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.4),
                              ),


                            )
                        ),
                        Padding(padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "New Coiffure",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Découvrez nos services exclusifs",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                              const SizedBox(height: 15),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: const Color(0xFFFF6B6B),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 25,
                                    vertical: 10,
                                  ),
                                ),
                                child: const Text("En Savoir Plus"),
                              ),

                            ],
                          ),

                        ),
                      ],
                    ),
                  ),

                )

            ),
            // Section "Nos Services"
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nos Services",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Découvrez notre gamme complète",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Grille de services améliorée

            SliverPadding(padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(delegate: SliverChildListDelegate([
                _buildServiceCard("Coiffure", "À partir de 25€", Icons.content_cut, Colors.blue,  "assets/images/barber1.png"),
                _buildServiceCard(
                  "Nettoyage",
                  "À partir de 15€",
                  Icons.clean_hands,
                  Colors.green,
                  "assets/images/barber4.png",
                ),
                _buildServiceCard(
                  "Massage",
                  "À partir de 35€",
                  Icons.spa,
                  Colors.purple,
                  "assets/images/massage.png",
                ),
                _buildServiceCard(
                  "Voile",
                  "À partir de 20€",
                  Icons.woman,
                  Colors.orange,
                  "assets/images/voile.png",
                ),
              ]),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.9)),
            ),
            // Section "À venir"
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Prochains rendez-vous",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    _AppointmentCard(),
                    SizedBox(height: 10),
                    _AppointmentCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
        // botton navigationbar
        bottomNavigationBar: Bottonnavigation(),
      ),
    );
  }

  Widget _buildServiceCard(String title,
      String price,
      IconData icon,
      Color color,
      String imagePath,){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
           decoration: BoxDecoration(shape: BoxShape.circle,color: color.withOpacity(0.1),
           
           ),
           child: Icon(icon , color: color,
             size: 30,),
         ),
         const SizedBox(height: 10),
         Text(
           title,
           style: const TextStyle(
             fontSize: 16,
             fontWeight: FontWeight.bold,
           ),
         ),
         const SizedBox(height: 5),
         Text(
           price,
           style: TextStyle(
             fontSize: 12,
             color: Colors.grey.shade600,
           ),
         ),
       ],
     ),
    );
  }

}

class _AppointmentCard extends StatelessWidget {
  const _AppointmentCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.calendar_today,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Coupe + Brushing",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 14,
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Aujourd'hui 14:30",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Confirmé",
              style: TextStyle(
                fontSize: 12,
                color: Colors.green.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

