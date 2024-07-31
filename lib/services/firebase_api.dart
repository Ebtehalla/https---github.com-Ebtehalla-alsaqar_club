import 'dart:core';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/player_model.dart';

class FirebaseApiService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<PlayerModel>> getAllPlayers() async {
    CollectionReference playersCollection = _firestore.collection('players');
    return playersCollection.get().then((snapshot) {
      List<PlayerModel> playersList = [];
      for (var doc in snapshot.docs) {
        playersList
            .add(PlayerModel.fromJson(doc.data() as Map<String, dynamic>));
      }
      log(playersList.toString());
      return playersList;
    });
  }

  Future<void> createNews(String title, String imageUrl) async {
    final CollectionReference newsCollection = _firestore.collection('news');
    await newsCollection.add({
      'title': title,
      'imageUrl': imageUrl,
    });
  }

  readFromFirestore(String s) {}
}
