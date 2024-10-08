// import 'package:alsagr_app/components/drawer.dart';
// import 'package:alsagr_app/components/network_image.dart';
// import 'package:alsagr_app/core/extensions/build_context.dart';
// import 'package:flutter/material.dart';

// class OrgStrctureScreeen extends StatelessWidget {
//   const OrgStrctureScreeen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: MyDrawer(),
//       appBar: AppBar(
//         title: const Text('الهيكل التنظيمي'),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ClipOval(
//               child: Image.asset(
//                 'assets/112.png',
//                 height: 100,
//                 width: 60,
//               ),
//             ),
//           )
//         ],
//         backgroundColor: const Color.fromRGBO(131, 40, 117, 1.000),
//         centerTitle: true,
//         toolbarHeight: 60,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomRight: Radius.circular(30),
//             bottomLeft: Radius.circular(30),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: AppCashedImage(
//           imageUrl:
//               "https://alsaqerfc.sa/storage/photos/cuvTC6c3fbHZ9KEvzxxPGq4XVhyaMtazpnEHPclJ.png",
//           fit: BoxFit.contain,
//           height: context.height,
//           width: context.width,
//         ),
//       ),
//     );
//   }
// }
import 'package:alsagr_app/components/drawer.dart';
import 'package:alsagr_app/components/network_image.dart';
import 'package:alsagr_app/core/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrgStrctureScreeen extends StatelessWidget {
  const OrgStrctureScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('الهيكل التنظيمي'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Image.asset(
                'assets/112.png',
                height: 100,
                width: 60,
              ),
            ),
          )
        ],
        backgroundColor: const Color.fromRGBO(131, 40, 117, 1.000),
        centerTitle: true,
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
          ),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('structer')
            .doc('newStructer')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          var imageUrl = snapshot.data!['image'];
          return SingleChildScrollView(
            child: AppCashedImage(
              imageUrl: imageUrl,
              fit: BoxFit.contain,
              height: context.height,
              width: context.width,
            ),
          );
        },
      ),
    );
  }
}
