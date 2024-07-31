// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'opinion_poll_model.dart';

class AudiancePoll {
  List<OpinionPoll> polls ;
  String message;
  String id;
  AudiancePoll({
    required this.polls,
    required this.message,
    required this.id,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'polls': polls.map((x) => x.toMap()).toList(),
      'message': message,
      'id': id,
    };
  }



  @override
  String toString() => 'AudiancePoll(polls: $polls, message: $message, id: $id)';

  @override
  bool operator ==(covariant AudiancePoll other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.polls, polls) &&
      other.message == message &&
      other.id == id;
  }

  @override
  int get hashCode => polls.hashCode ^ message.hashCode ^ id.hashCode;
}
