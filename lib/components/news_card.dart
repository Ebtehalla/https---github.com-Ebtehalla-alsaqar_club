import 'package:alsagr_app/components/network_image.dart';
import 'package:alsagr_app/pages/news_full_information.dart';
import 'package:flutter/material.dart';

class MyNewsCard extends StatefulWidget {
  final String title;
  final String category;
  final String img;
  final String content;
  final String time;
  const MyNewsCard(
      {super.key,
      required this.title,
      required this.category,
      required this.img,
      required this.content,
      required this.time});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imageUrl': img,
    };
  }

  @override
  State<MyNewsCard> createState() => _MyNewsCardState();
}

class _MyNewsCardState extends State<MyNewsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: AppCashedImage(
                      fit: BoxFit.contain,
                      imageUrl: widget.img,
                    ),
                  );
                },
              );
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.shortestSide * 0.33,
              width: MediaQuery.of(context).size.shortestSide * 0.33,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: AppCashedImage(
                  fit: BoxFit.cover,
                  imageUrl: widget.img,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 12),
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  widget.title,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Column(
                children: [
                  // Text(
                  //   widget.category,
                  //   style: const TextStyle(
                  //     color: Colors.black45,
                  //     fontSize: 14,
                  //     fontWeight: FontWeight.w300,
                  //   ),
                  // ),
                  // Text(widget.time.toString()),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FullNews(
                          category: widget.category,
                          content: widget.content,
                          img: widget.img,
                          time: widget.time,
                          title: widget.title,
                        ),
                      ));
                    },
                    child: const Text('المزيد'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox()
        ].reversed.toList(),
      ),
    );
  }
}
