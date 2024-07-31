// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SuggestModel {

  final String name;
  final String subject;
  final String TypeOfRequest;
  final String message;

  SuggestModel({
    required this.name,
    required this.subject,
    required this.TypeOfRequest,
    required this.message,
  });

  SuggestModel copyWith({
    String? name,
    String? subject,
    String? TypeOfRequest,
    String? message,
  }) {
    return SuggestModel(
      name: name ?? this.name,
      subject: subject ?? this.subject,
      TypeOfRequest: TypeOfRequest ?? this.TypeOfRequest,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'subject': subject,
      'TypeOfRequest': TypeOfRequest,
      'message': message,
    };
  }

  factory SuggestModel.fromMap(Map<String, dynamic> map) {
    return SuggestModel(
      name: map['name'] as String,
      subject: map['subject'] as String,
      TypeOfRequest: map['TypeOfRequest'] as String,
      message: map['message'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SuggestModel.fromJson(String source) =>
      SuggestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ContactUsModel(name: $name, subject: $subject, TypeOfRequest: $TypeOfRequest, message: $message)';
  }

  @override
  bool operator ==(covariant SuggestModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.subject == subject &&
      other.TypeOfRequest == TypeOfRequest &&
      other.message == message;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      subject.hashCode ^
      TypeOfRequest.hashCode ^
      message.hashCode;
  }
}
