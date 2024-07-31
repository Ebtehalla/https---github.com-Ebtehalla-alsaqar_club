import 'dart:developer';

import 'package:alsagr_app/models/suggest_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class SuggestApis {
  static Future<bool> addMessageToFirestore(
    SuggestModel suggestModel,
  ) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference technicalSupport =
          firestore.collection('suggest');
      // Add the course data to Firestore
      await firestore.runTransaction((transaction) async {
        transaction.set(
          technicalSupport.doc(),
          suggestModel.toMap(),
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
