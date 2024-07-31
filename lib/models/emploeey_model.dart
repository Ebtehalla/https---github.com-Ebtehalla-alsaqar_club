// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EmploeeyModel {
  final String email;
  final String phone;
  final String name;
  final String age;
  final String cv;

  EmploeeyModel({
    required this.email,
    required this.phone,
    required this.name,
    required this.age,
    required this.cv,
  });

  EmploeeyModel copyWith({
    String? email,
    String? phone,
    String? name,
    String? age,
    String? cv,
  }) {
    return EmploeeyModel(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      age: age ?? this.age,
      cv: cv ?? this.cv,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'phone': phone,
      'name': name,
      'age': age,
      'cv': cv,
    };
  }

  factory EmploeeyModel.fromMap(Map<String, dynamic> map) {
    return EmploeeyModel(
      email: map['email'] as String,
      phone: map['phone'] as String,
      name: map['name'] as String,
      age: map['age'] as String,
      cv: map['cv'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmploeeyModel.fromJson(String source) =>
      EmploeeyModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EmploeeyModel(email: $email, phone: $phone, name: $name, age: $age, cv: $cv)';
  }

  @override
  bool operator ==(covariant EmploeeyModel other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.phone == phone &&
        other.name == name &&
        other.age == age &&
        other.cv == cv;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        phone.hashCode ^
        name.hashCode ^
        age.hashCode ^
        cv.hashCode;
  }
}
