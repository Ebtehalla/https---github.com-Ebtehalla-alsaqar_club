import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseApi {
  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> readFromFirestore(
      String collectionName) async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection(collectionName).get();

      if (snapshot.docs.isEmpty) {
        log('No documents found in the collection.');
        return [];
      }

      return snapshot.docs;
    } catch (e) {
      log('Error reading from Firestore: $e');
      return [];
    }
  }
}

class Hotel extends StatefulWidget {
  const Hotel({super.key});

  @override
  State<Hotel> createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          FutureBuilder<List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
            future: FirebaseApi().readFromFirestore('news'),
            builder: (BuildContext context,
                AsyncSnapshot<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
                    snapshot) {
              // Check the connection state and return the appropriate widget
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Replace with your desired loading widget
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                // Data has been fetched successfully
                final newsData = snapshot.data;
                if (newsData!.isEmpty) {
                  return const Text('No news found');
                }
                return Column(
                  children: newsData.map((news) {
                    final newsTitle = news.get('title');
                    final imageUrl = news.get('img');
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(215, 172, 78, 1.000),
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          width: 400,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Text(
                              newsTitle ??
                                  'نادي الصقر يوقع إتفاقية مع فندق جولدن توليب',
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        if (imageUrl != null)
                          Image.network(
                            imageUrl,
                            width: 500,
                            height: 450,
                          ),
                        const SizedBox(height: 10.0),
                        const Divider(
                          thickness: 1.0,
                          color: Colors.grey,
                          indent: 50.0,
                          endIndent: 50.0,
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    );
                  }).toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
