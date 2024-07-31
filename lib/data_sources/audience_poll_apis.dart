import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/audience_poll_model.dart';


class AudiencePollApis {
  static Future<bool> addMessageToFirestore(
    AudiancePoll opinionPoll,
  ) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference audiancePolls =
          firestore.collection('Audiance polls');
      // Add the course data to Firestore
      await firestore.runTransaction((transaction) async {
        transaction.set(
          audiancePolls.doc(),
          opinionPoll.toMap(),
        );
      });
      log('Technical Support added to Firestore successfully!');
      return true;
    } catch (e) {
      log('Error adding Technical Support to Firestore: $e');
      return false;
    }
  }
}

class VistorsPollApis {
  static Future<bool> addMessageToFirestore(
    AudiancePoll opinionPoll,
  ) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference audiancePolls =
          firestore.collection('Vistors polls');
      // Add the course data to Firestore
      await firestore.runTransaction((transaction) async {
        transaction.set(
          audiancePolls.doc(),
          opinionPoll.toMap(),
        );
      });
      log('Technical Support added to Firestore successfully!');
      return true;
    } catch (e) {
      log('Error adding Technical Support to Firestore: $e');
      return false;
    }
  }
}

class EmployeesPollApis {
  static Future<bool> addMessageToFirestore(
    AudiancePoll opinionPoll,
  ) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference audiancePolls =
          firestore.collection('Employees polls');
      // Add the course data to Firestore
      await firestore.runTransaction((transaction) async {
        transaction.set(
          audiancePolls.doc(),
          opinionPoll.toMap(),
        );
      });
      log('Technical Support added to Firestore successfully!');
      return true;
    } catch (e) {
      log('Error adding Technical Support to Firestore: $e');
      return false;
    }
  }
}

