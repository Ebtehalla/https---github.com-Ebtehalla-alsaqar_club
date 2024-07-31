import 'package:flutter/material.dart';

// ignore: camel_case_types
class Mangarmm extends StatefulWidget {
  const Mangarmm({super.key});

  @override
  State<Mangarmm> createState() => _MangarmmState();
}

class _MangarmmState extends State<Mangarmm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
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
              child: Center(
                child: Text(
                  'رئيس مجلس الإدارة يستضيف منسوبي النادي',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10.0), // Add a SizedBox to adjust spacing

          const Divider(
            // Add a Divider widget
            thickness: 1.0, // Set the desired thickness of the line
            color: Colors.grey, // Set the desired color of the line
            indent: 50.0, // Set the desired indent (left padding) of the line
            endIndent:
                50.0, // Set the desired end indent (right padding) of the line
          ),

          const SizedBox(height: 10.0), // Add a SizedBox to adjust spacing

          const Image(
            // image: AssetImage('assets/end-sport.jpg'),

            image: AssetImage('assets/mangar-sd.jpeg'),
            width: 500,
            height: 450,
          ),
        ],
      ),
    );
  }
}
