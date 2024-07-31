import 'package:alsagr_app/components/drawer.dart';
import 'package:alsagr_app/components/network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Match {
  final String team1;
  final String team2;
  final String team1Image;
  final String team2Image;
  final String stadium;
  final String matchDate;
  final String matchTime;
  final String matchDay;

  Match({
    required this.team1,
    required this.team2,
    required this.team1Image,
    required this.team2Image,
    required this.stadium,
    required this.matchDate,
    required this.matchTime,
    required this.matchDay,
  });
}

class Sportclander extends StatefulWidget {
  const Sportclander({super.key});

  @override
  State<Sportclander> createState() => _SportclanderState();
}

class _SportclanderState extends State<Sportclander> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text(
          'جدول المباريات',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
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
          ),
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('matches')
            .snapshots(), // استبدل 'matches' بالاسم الفعلي لمجموعتك
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Match> matches = [];
          for (var document in snapshot.data!.docs) {
            matches.add(
              Match(
                team1: document['team1'],
                team2: document['team2'],
                team1Image: document['team1Image'],
                team2Image: document['team2Image'],
                stadium: document['stadium'],
                matchDate: document['matchDate'],
                matchTime: document['matchTime'],
                matchDay: document['matchDay'],
              ),
            );
          }
          return ListView.builder(
            itemCount: matches.length,
            itemBuilder: (context, index) {
              Match match = matches[index];
              bool isFirstRow =
                  index == 0; // تحديد ما إذا كان الصف الحالي هو الصف الأول
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    if (isFirstRow) // عرض الصورة والعنوان فقط في الصف الأول
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/new logoo.png',
                              width: 160,
                              height: 160,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'الصقر',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromARGB(255, 34, 33, 33),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.topRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  size: 16,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  match.matchDate,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(215, 172, 78, 1.000),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                'دوري الدرجة الثانية',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        children: [
                                          AppCashedImage(
                                            imageUrl: match.team1Image,
                                            isCircular: true,
                                            fit: BoxFit.contain,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(match.team1),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                    thickness: 1,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        children: [
                                          AppCashedImage(
                                            imageUrl: match.team2Image,
                                            isCircular: true,
                                            fit: BoxFit.contain,
                                          ),
                                          const SizedBox(height: 8),
                                          Text(match.team2),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                    thickness: 1,
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        alignment: Alignment.topRight,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            const Icon(
                                              Icons.schedule,
                                              size: 16,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              match.matchTime,
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          match
                                              .matchDay, // Display the day field
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      // باقي الأكواد...
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                    thickness: 2.0,
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                    thickness: 1,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      child: Center(
                                        child: Text(
                                          match.stadium,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
