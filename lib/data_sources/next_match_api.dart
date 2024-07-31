import 'dart:developer';

import 'package:alsagr_app/models/next_match_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NextMatchDataSources {
  static const String nextMatchCollection = "NextMatch";

  Future<NextMatchModel?> getNextMatch() async {
    NextMatchModel? nextMatchModel;
    try {
      CollectionReference collection =
          FirebaseFirestore.instance.collection('NextMatch');
      QuerySnapshot querySnapshot = await collection.get();
      // Loop through the documents and access the data
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        Map<String, dynamic> data = document.data() as Map<String, dynamic>;
        nextMatchModel = NextMatchModel.fromMap(data);
        return nextMatchModel;
      }
    } catch (e) {
      log('Error getting data: $e');
      return null;
    }
    return nextMatchModel;
  }

  // static Future<void> addNextMatchToFirestore(NextMatchModel course) async {
  //   try {
  //     course = NextMatchModel(
  //         location: "استاد الملك فيصل",
  //         url: "https://www.transfermarkt.com/zamalek-sc/startseite/verein/664",
  //         away: ClubModel(
  //             id: 1,
  //             name: "Zamalek SC",
  //             image:
  //                 "https://tmssl.akamaized.net/images/wappen/head/664.png?lm=1415485832",
  //             url:
  //                 "https://tmssl.akamaized.net/images/wappen/head/664.png?lm=1415485832"),
  //         home: ClubModel(
  //             id: 2,
  //             url: "https://alsaaqerclub.sa",
  //             name: "نادي الصقر الرياضي ",
  //             image:
  //                 "https://alsaaqerclub.sa/wp-content/uploads/2023/09/WEEB20221-e1670246395930.png"),
  //         id: 1,
  //         time: DateTime.now().add(
  //           const Duration(days: 3),
  //         ));
  //     FirebaseFirestore firestore = FirebaseFirestore.instance;
  //     DocumentReference services =
  //         firestore.collection('NextMatch').doc("next_match");

  //     await firestore.runTransaction((transaction) async {
  //       transaction.set(services, course.toMap());
  //     });
  //     //BotToast.showText(text: 'Next Match added to Firestore successfully!');
  //   } catch (e) {
  //     log('Error adding Next Match to Firestore: $e');
  //   }
  // }
}
