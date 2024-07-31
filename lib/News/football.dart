// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Football extends StatefulWidget {
  const Football({super.key});

  @override
  State<Football> createState() => _FootballState();
}

class _FootballState extends State<Football> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          // FutureBuilder(
          //   future: FirebaseApiService().readFromFirestore('news'),
          //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const CircularProgressIndicator();
          //     } else if (snapshot.hasError) {
          //       return Text('Error: ${snapshot.error}');
          //     } else if (!snapshot.hasData || snapshot.data.isEmpty) {
          //       return const Text('No documents found in the collection.');
          //     } else {
          //       final List<QueryDocumentSnapshot<Map<String, dynamic>>>
          //           documentList = snapshot.data
          //               as List<QueryDocumentSnapshot<Map<String, dynamic>>>;

          //       return Column(
          //         children: documentList.map((document) {
          //           return Column(
          //             children: [
          //               Text('Document ID: ${document.id}'),
          //               Text('Data: ${document.data()}'),
          //             ],
          //           );
          //         }).toList(),
          //       );
          //     }
          //   },
          // ),
          const SizedBox(height: 18.0),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(215, 172, 78, 1.000),
              borderRadius: BorderRadius.circular(60),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            width: 400,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Center(
              child: Text(
                ' فرص الاستثمار مع وزارة الرياضية',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const Divider(
            thickness: 1.0,
            color: Colors.grey,
            indent: 50.0,
            endIndent: 50.0,
          ),
        ],
      ),
    );
  }
}
