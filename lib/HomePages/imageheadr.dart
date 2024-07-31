import 'package:alsagr_app/data_sources/news_api.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/network_image.dart';
import '../models/news_model.dart';

class ImageHeadr extends StatefulWidget {
  const ImageHeadr({super.key});

  @override
  State<ImageHeadr> createState() => _ImageHeadrState();
}

class _ImageHeadrState extends State<ImageHeadr> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsModel>?>(
      future: getNews(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var news = snapshot.data;
          return CarouselSlider.builder(
            itemCount: news?.length,
            itemBuilder: (context, index, realIndex) {
              var item = news?[index];
              return AppCashedImage(
                imageUrl: item?.img ?? "",
                fit: BoxFit.cover,
                width: context.width,
              );
            },
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 6),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
