import 'package:flutter/material.dart';


enum BookingStatus { pending, confirmed, cancelled, completed, }

class BookingModel {
  final String id;
  final String clientName;
  final String serviceName;
  final String hairdresserName;
  final DateTime date;
  BookingStatus status;
  String? cancellationReason;

  BookingModel({
    required this.id,
    required this.clientName,
    required this.serviceName,
    required this.hairdresserName,
    required this.date,
    this.status = BookingStatus.pending,
    this.cancellationReason,
  });
}

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  final List<BookingModel> _bookings = [
    BookingModel(
      id: "1",
      clientName: "John Doe",
      serviceName: "Coupe Homme Classique",
      hairdresserName: "Alex",
      date: DateTime.now().add(const Duration(days: 1)),
      status: BookingStatus.pending,
    ),
    BookingModel(
      id: "2",
      clientName: "Sarah Smith",
      serviceName: "Brushing",
      hairdresserName: "Emma",
      date: DateTime.now().add(const Duration(days: 2)),
      status: BookingStatus.confirmed,
    ),
  ];

  void _cancelBooking(String id) {
    setState(() {
      final booking =
      _bookings.firstWhere((b) => b.id == id);
      booking.status = BookingStatus.cancelled;
    });
  }
  void cancelBooking(BookingModel booking, String reason) {
    setState(() {
      booking.status = BookingStatus.cancelled;
      booking.cancellationReason = reason;
    });
  }
  void showCancelDialog(BuildContext context, BookingModel booking) {
    TextEditingController reasonController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Annuler le rendez-vous"),
          content: TextField(
            controller: reasonController,
            decoration: InputDecoration(
              hintText: "Entrer la cause de l'annulation",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Retour"),
            ),
            ElevatedButton(
              onPressed: () {
                cancelBooking(booking, reasonController.text);
                Navigator.pop(context);
              },
              child: Text("Confirmer"),
            )
          ],
        );
      },
    );
  }

  Color statusColor(BookingStatus status) {
    switch (status) {
      case BookingStatus.pending:
        return Colors.orange;

      case BookingStatus.confirmed:
        return Colors.green;

      case BookingStatus.cancelled:
        return Colors.red;

      case BookingStatus.completed:
        return Colors.blue;  // AJOUTÉ

    }
  }

  String statusText(BookingStatus status) {
    switch (status) {
      case BookingStatus.pending:
        return "En attente";

      case BookingStatus.confirmed:
        return "Confirmé";

      case BookingStatus.cancelled:
        return "Annulé";

      case BookingStatus.completed:
        return "Terminé";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des Rendez-vous"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _bookings.length,
        itemBuilder: (context, index) {
          final booking = _bookings[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 15),
            shape: RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(16),
            ),
            child: Padding(
              padding:
              const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    booking.clientName,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight:
                        FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                      "Service : ${booking.serviceName}"),
                  Text(
                      "Coiffeur : ${booking.hairdresserName}"),
                  Text(
                      "Date : ${booking.date.day}/${booking.date.month}/${booking.date.year}"),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,
                    children: [
                      Container(
                        padding:
                        const EdgeInsets
                            .symmetric(
                            horizontal: 12,
                            vertical: 6),
                        decoration:
                        BoxDecoration(
                          color: statusColor(
                              booking
                                  .status)
                              .withOpacity(0.15),
                          borderRadius:
                          BorderRadius
                              .circular(20),
                        ),
                        child: Text(
                          statusText(
                              booking.status),
                          style: TextStyle(
                              color: statusColor(
                                  booking
                                      .status),
                              fontWeight:
                              FontWeight
                                  .bold),
                        ),
                      ),

                      if (booking.status !=
                          BookingStatus
                              .cancelled)
                        TextButton(
                          onPressed: () =>
                              _cancelBooking(
                                  booking.id),
                          child: const Text(
                            "Annuler",
                            style: TextStyle(
                                color:
                                Colors.red),
                          ),
                        )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}