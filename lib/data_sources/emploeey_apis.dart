import 'dart:developer';

import 'package:alsagr_app/models/emploeey_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class EmploeeyApis {
  static Future<bool> addMessageToFirestore(
    EmploeeyModel emploeeyModel,
  ) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference technicalSupport =
          firestore.collection('emploeey');
      // Add the course data to Firestore
      await firestore.runTransaction((transaction) async {
        transaction.set(
          technicalSupport.doc(),
          emploeeyModel.toMap(),
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
