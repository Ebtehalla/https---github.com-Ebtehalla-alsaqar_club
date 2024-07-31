// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NewsModel {
  final String? title;
  final String? img;
  NewsModel({
    this.title,
    this.img,
  });

  NewsModel copyWith({
    String? title,
    String? img,
  }) {
    return NewsModel(
      title: title ?? this.title,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'img': img,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      title: map['title'] != null ? map['title'] as String : null,
      img: map['img'] != null ? map['img'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'NewsModel(title: $title, img: $img)';

  @override
  bool operator ==(covariant NewsModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.img == img;
  }

  @override
  int get hashCode => title.hashCode ^ img.hashCode;
}
