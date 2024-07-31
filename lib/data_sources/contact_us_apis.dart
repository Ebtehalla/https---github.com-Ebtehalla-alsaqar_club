import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/contact_us_model.dart';

class ContactUsAPIS {
  static Future<bool> addMessageToFirestore(
    ContactUsModel contactUsModel,
  ) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference technicalSupport =
          firestore.collection('contact');
      // Add the course data to Firestore
      await firestore.runTransaction((transaction) async {
        transaction.set(
          technicalSupport.doc(),
          contactUsModel.toMap(),
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
