import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../a_widgets/text.dart';

class ViewService extends StatefulWidget {
  @override
  State<ViewService> createState() => _ViewServiceState();
}

class _ViewServiceState extends State<ViewService> {
  final currentuser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 5,
          title: const Text(
            "Available Services",
            style: TextStyle(fontSize: 16),
          ),
          centerTitle: true,
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collectionGroup('myservices')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<DocumentSnapshot> documents = snapshot.data!.docs;
              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot document = documents[index];
                  final serviceName = document['serviceName'];
                  final cp = document['cp'];
                  final des = document['description'];
                  final itemcode = document['itemcode'];
                  final yp = document['yp'];
                  final workerId = document['workerID'];
                  final img = document['imageUrl'];
                  //final image = document['img'];

                  return FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('worker')
                        .doc(workerId)
                        .get(),
                    builder: (context, workerSnapshot) {
                      if (workerSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        // Return a loading indicator while waiting for the worker data
                        // return Center(
                        //   child: CircularProgressIndicator(
                        //     color: Colors.blue,
                        //   ),
                        // );
                      }

                      if (workerSnapshot.hasError) {
                        return Text('Error fetching worker data');
                      }

                      final workerData = workerSnapshot.data;
                      final workerName = workerData?['name'];
                      // final workerContact = workerData?['contact'];
                      //final workerExperience = workerData?['experience'];

                      return Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          margin: const EdgeInsets.only(right: 10, left: 10),
                          height: MediaQuery.of(context).size.height * 0.26,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: const Color.fromARGB(255, 195, 179, 179),
                              width: 1,
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      img,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.19,
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      AutoSizeText(
                                        "Woker Name : ${workerName}",
                                        style: GoogleFonts.abel(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        minFontSize: 8,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Divider(),
                                      Row(
                                        children: [
                                          Text(
                                            'C.P. =  $cp',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          const Text("       "),
                                          Text('Y.C. = $yp',
                                              style: TextStyle(fontSize: 12))
                                        ],
                                      ),
                                      const Divider(),
                                      AutoSizeText(
                                        "Item Code :  $itemcode",
                                        style: GoogleFonts.acme(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        minFontSize: 8,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Divider(),
                                      AutoSizeText(
                                        "Product Name :  $serviceName",
                                        style: GoogleFonts.acme(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        minFontSize: 8,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Divider(),
                                      AutoSizeText(
                                        "Des:   $des",
                                        style: GoogleFonts.abel(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                        ),
                                        minFontSize: 8,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextStyleWidget(
                                            fontSize: 12,
                                            // text: "Rs ${cp.toStringAsFixed(1)}",
                                            text: "Rs $cp",
                                            color: Colors.green,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Text('Error fetching services');
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
