// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:alsagr_app/News/Hotel.dart';
import 'package:alsagr_app/components/drawer.dart';
import 'package:alsagr_app/components/news_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text(
          "الاخبار",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: const Color.fromRGBO(131, 40, 117, 1.000),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: FirebaseApi().readFromFirestore('news'),
            builder: (context, snapshot) {
              if (snapshot.hasData == false) {
                return const Center(
                  child: RefreshProgressIndicator(),
                );
              }
              var news = snapshot.data as List<DocumentSnapshot>;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: news.length,
                      itemBuilder: (context, index) {
                        var item = news[index].data() as Map<dynamic, dynamic>;
                        Map<String, dynamic> map = Map.from(item);
                        DateTime dateTime = map['time'].toDate();
                        String year = dateTime.year.toString();
                        String month = dateTime.month.toString();
                        String day = dateTime.day.toString();
                        // ignore: no_leading_underscores_for_local_identifiers
                        String _dateTime = '$year-$month-$day';
                        return MyNewsCard(
                          title: map['title'],
                          category: map['category'],
                          img: map['img'],
                          content: map['content'],
                          time: _dateTime,
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
