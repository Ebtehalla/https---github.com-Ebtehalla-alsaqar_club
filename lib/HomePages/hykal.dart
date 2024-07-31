import 'package:alsagr_app/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Hakll extends StatefulWidget {
  const Hakll({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HakllState createState() => _HakllState();
}

class _HakllState extends State<Hakll> {
  late Future<Widget> imageFromFirestore;

  @override
  void initState() {
    super.initState();
    imageFromFirestore = getImageFromFirestore();
  }

  Future<Widget> getImageFromFirestore() async {
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('structer')
        .doc('newStructer')
        .get();

    final String imageURL = snapshot.get('image');
    return Image.network(imageURL);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('الهيكل التنظيمي'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Image.asset(
                'assets/112.png',
                height: 100,
                width: 60,
              ),
            ),
          )
        ],
        backgroundColor: const Color.fromRGBO(131, 40, 117, 1.000),
        centerTitle: true,
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FutureBuilder<Widget>(
                      future: imageFromFirestore,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return const Icon(Icons.error);
                        }
                        return snapshot.data ?? Container();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
