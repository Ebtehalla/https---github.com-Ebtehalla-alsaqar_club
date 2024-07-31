// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:alsagr_app/components/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class PlanClub extends StatefulWidget {
  const PlanClub({super.key});

  @override
  State<PlanClub> createState() => _PlanClubState();
}

class _PlanClubState extends State<PlanClub> {
  void _openPlanClub() async {
    const url =
        'https://firebasestorage.googleapis.com/v0/b/alsaqar-566d3.appspot.com/o/__%D8%A7%D8%B3%D8%AA%D8%B1%D8%A7%D8%AA%D9%8A%D8%AC%D9%8A%D8%A9%20%D8%A7%D9%84%D9%86%D8%A7%D8%AF%D9%8A%20%D8%A7%D9%84%D8%B1%D8%B3%D9%85%D9%8A%D8%A9%20(1).pdf?alt=media&token=2eb2af27-f55a-4cc8-a37c-346f9fabc0c9&_gl=1*bg1hal*_ga*ODA4MDQ0ODgzLjE2OTY4NzEyNDk.*_ga_CW55HF8NVT*MTY5Njg4NDExMS40LjEuMTY5Njg4NTM3My41NS4wLjA.';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(''),
          actions: [
            ClipOval(
              child: Image.asset(
                'assets/112.png',
                height: 100,
                width: 60,
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
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 160),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: _openPlanClub,
                  child: Container(
                    width: 150,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 90, 42, 79),
                          Color.fromARGB(255, 107, 67, 114),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'وثيقة الخطة الإستراتيجية للنادي (2023-2027)',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 500),
              Center(
                child: Container(
                  alignment: Alignment.centerRight,
                  color: const Color.fromARGB(255, 107, 67, 114),
                  child: const Text(
                    'نادي الصقر السعودي @2023',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
