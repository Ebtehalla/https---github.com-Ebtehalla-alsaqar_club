import 'dart:core';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/player_model.dart';

class FirebaseApiService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future addPlayersToFirebase() async {
    // print("deleting players");
    // //! Start deleting players from the firestore
    // try {
    //   final instance = FirebaseFirestore.instance;
    //   final batch = instance.batch();
    //   var collection = instance.collection('players');
    //   var snapshots = await collection.get();
    //   for (var doc in snapshots.docs) {
    //     batch.delete(doc.reference);
    //   }
    //   await batch.commit();
    // } catch (e) {
    //   print(e);
    // }
    // print("done deleting players");

    //! End deleting players from the firestore
    //! Start adding players to the firestore
    log("adding players to the firestore");
    List<PlayerModel> playersList = [];
    for (Map<String, dynamic> player in players) {
      playersList.add(PlayerModel.fromJson(player));
    }
    //print(playersList);
    // ignore: unused_local_variable
    CollectionReference playersCollection = _firestore.collection('players');
    for (var playerModel in playersList) {
      try {
        await _firestore
            .collection('players')
            .doc()
            .set(playerModel.toJson())
            .onError((error, stackTrace) => log(error.toString()))
            .then((value) {
          log("Player Uploaded successfully");
        });
      } catch (e) {
        log(e.toString());
      }
    }
    //! End adding players to the firestore
    return;
  }

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

  readFromFirestore(String s) {}
}
