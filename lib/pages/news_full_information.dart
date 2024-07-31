import 'package:alsagr_app/components/drawer.dart';
import 'package:flutter/material.dart';

class FullNews extends StatefulWidget {
  final String title;
  final String category;
  final String img;
  final String content;
  final String time;
  const FullNews({
    super.key,
    required this.title,
    required this.category,
    required this.img,
    required this.content,
    required this.time,
  });

  @override
  State<FullNews> createState() => _FullNewsState();
}

class _FullNewsState extends State<FullNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: AppDrawer(),
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text("الاخبار"),
        // backgroundColor: const Color.fromARGB(255, 86, 45, 93),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.8,
                  child: Image.network(
                    fit: BoxFit.contain,
                    widget.img,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/placeholder.PNG');
                    },
                  ),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Container(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(widget.time.toString()),
                        Text(
                          widget.category,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                Text(widget.content),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
