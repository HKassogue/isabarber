import 'package:flutter/material.dart';
import 'package:isabarder/constants/colors.dart';

class Profiluser extends StatelessWidget {
  const Profiluser({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ PLUS DE MaterialApp ici !
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // Ton SliverAppBar existant...
          SliverAppBar(
            expandedHeight: 120,
            backgroundColor: Colors.transparent,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [tdblueWithopacity, tdmarron])),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Bonjour 👋",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white70),
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
                          height: 44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: tdWhite.withOpacity(0.2)),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_outlined,
                                color: tdWhite,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Le reste de ton code (SliverPadding, etc.)
          SliverPadding(
            padding: const EdgeInsets.all(30),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF6B6B), Color(0xFF4ECDC4)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Quick Actions",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Expanded(
                        child: GridView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 0.9,
                          ),
                          children: [
                            _buildActionCard(
                                "BrowseService", Icons.content_cut, tdBlue),
                            _buildActionCard(
                                "My Bookings", Icons.woman, tdBlue),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 20 , right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Upcoming Appointments",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
            ),
          ),
          SliverPadding(padding: const EdgeInsets.only(left: 20 , right: 20),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                __AppointmentCard("Haircut", "with Sarah Smith", "Confirmed", "35", "Feb 12 , 2026"),
                __AppointmentCard("Hair Coloring", "With Mike Johson", "Pending", "85.00", "Mars 15  2026 , 2:00 PM"),
                __AppointmentCard("Massge", "with Fatoumata", "Confirmed", "100", "Mars 24  2026 14h")
              ]
            ),

            ),
          ),

          SliverPadding(padding: const EdgeInsets.only(bottom: 20),
          sliver: SliverToBoxAdapter(
            child: Container(),
          ),
          )


        ],
      ),
    );
  }

  // Ta méthode _buildActionCard reste identique
  Widget _buildActionCard(String title, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: tdWhite,
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
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: color.withOpacity(0.1)),
            child: Icon(
              icon,
              color: color,
              size: 30,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

Widget __AppointmentCard(String title, String subtitle , String status , String price , String date ){

  return Container(
    margin: const EdgeInsets.only(bottom: 8 , top: 12),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: tdBGColor,
      borderRadius: BorderRadius.circular(12)
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title ,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16
            ),),
            Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: status == "Confirmed"
                      ? Colors.green      // Vert pour confirmé
                      : status == "Pending"
                      ? Colors.orange  // Orange pour en attente
                      : Colors.red,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Text(status , style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 12
              ),),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle , style: TextStyle(
              color: Colors.black45 ,
              fontSize: 14,
            ),),
            SizedBox(height: 6,),
            Row(
              children: [
                Icon(Icons.calendar_today , size: 20,),
                SizedBox(width: 5,),
                Text(date , style: TextStyle(
                  color: Colors.black ,
                  fontSize: 14,
                ),),

              ],
            ),
            SizedBox(height: 10,),
            Divider(),
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(price , style: TextStyle(
                  color: Colors.black ,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),),
                TextButton(onPressed: (){}, child: Text("Cancel" , style: TextStyle(
                  color: Colors.redAccent ,
                  fontSize: 13,
                ),))
              ],
            )
          ],

        ),

      ],
    ),
  );
}