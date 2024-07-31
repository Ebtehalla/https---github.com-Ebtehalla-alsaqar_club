// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NextMatchModel {
  final int? id;
  final String? location;
  final DateTime? time;
  final ClubModel? home;
  final ClubModel? away;
  final String? url;
  NextMatchModel({
    this.id,
    this.location,
    this.time,
    this.home,
    this.away,
    this.url,
  });

  NextMatchModel copyWith({
    int? id,
    String? location,
    DateTime? time,
    ClubModel? home,
    ClubModel? away,
    String? url,
  }) {
    return NextMatchModel(
      id: id ?? this.id,
      location: location ?? this.location,
      time: time ?? this.time,
      home: home ?? this.home,
      away: away ?? this.away,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'location': location,
      'time': time?.millisecondsSinceEpoch,
      'home': home?.toMap(),
      'away': away?.toMap(),
      'url': url,
    };
  }

  factory NextMatchModel.fromMap(Map<String, dynamic> map) {
    return NextMatchModel(
      id: map['id'] != null ? map['id'] as int : null,
      location: map['location'] != null ? map['location'] as String : null,
      time: map['time'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['time'] as int)
          : null,
      home: map['home'] != null
          ? ClubModel.fromMap(map['home'] as Map<String, dynamic>)
          : null,
      away: map['away'] != null
          ? ClubModel.fromMap(map['away'] as Map<String, dynamic>)
          : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory NextMatchModel.fromJson(String source) =>
      NextMatchModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NextMatchModel(id: $id, location: $location, time: $time, home: $home, away: $away, url: $url)';
  }

  @override
  bool operator ==(covariant NextMatchModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.location == location &&
        other.time == time &&
        other.home == home &&
        other.away == away &&
        other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        location.hashCode ^
        time.hashCode ^
        home.hashCode ^
        away.hashCode ^
        url.hashCode;
  }
}

class ClubModel {
  final int id;
  final String? image;
  final String? name;
  final String? url;

  ClubModel({
    required this.id,
    this.image,
    this.name,
    this.url,
  });

  ClubModel copyWith({
    int? id,
    String? image,
    String? name,
    String? url,
  }) {
    return ClubModel(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'name': name,
      'url': url,
    };
  }

  factory ClubModel.fromMap(Map<String, dynamic> map) {
    return ClubModel(
      id: map['id'] as int,
      image: map['image'] != null ? map['image'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClubModel.fromJson(String source) =>
      ClubModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ClubModel(id: $id, image: $image, name: $name, url: $url)';
  }

  @override
  bool operator ==(covariant ClubModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.image == image &&
        other.name == name &&
        other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^ image.hashCode ^ name.hashCode ^ url.hashCode;
  }
}
