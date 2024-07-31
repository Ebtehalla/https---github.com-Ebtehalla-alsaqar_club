// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ContactUsModel {

  final String email;
  final String phone;
  final String message;
  final String name;
  
  ContactUsModel({
    required this.email,
    required this.phone,
    required this.message,
    required this.name,
  });

  ContactUsModel copyWith({
    String? email,
    String? phone,
    String? message,
    String? name,
  }) {
    return ContactUsModel(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      message: message ?? this.message,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'phone': phone,
      'message': message,
      'name': name,
    };
  }

  factory ContactUsModel.fromMap(Map<String, dynamic> map) {
    return ContactUsModel(
      email: map['email'] as String,
      phone: map['phone'] as String,
      message: map['message'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactUsModel.fromJson(String source) =>
      ContactUsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ContactUsModel(email: $email, phone: $phone, message: $message, name: $name)';
  }

  @override
  bool operator ==(covariant ContactUsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.phone == phone &&
      other.message == message &&
      other.name == name;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      phone.hashCode ^
      message.hashCode ^
      name.hashCode;
  }
}
