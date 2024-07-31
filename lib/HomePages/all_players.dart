import 'dart:developer';

import 'package:flutter/material.dart';

class AllPlayers extends StatefulWidget {
  final List<Map<String, dynamic>> playersList;
  const AllPlayers({super.key, required this.playersList});

  @override
  State<AllPlayers> createState() => _AllPlayersState();
}

class _AllPlayersState extends State<AllPlayers> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> playersList = widget.playersList;
    log('صفحة جميع اللاعبين تسلم عليك وتقول');
    log(playersList.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('اللاعبين'),
        backgroundColor: const Color.fromRGBO(131, 40, 117, 1.000),
        centerTitle: true,
        toolbarHeight: 60,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 20.0,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2), //عدد اللاعبين بصف
                  itemCount: playersList.length,
                  // طيب لو قلنا نبي  لما نضغط على اللاعب نفسه يودينا لصفحة بس فيه اللاعب هذا
                  // فلازم ناخذ الماب حقه ونوديها ذيك الصفحة
                  // ف نقدر من الكارد نفسه نضيف لما تضغط يطلع لك اي ماب انمت الحين
                  // لحظه لا مانبي يودينا للاعب نكتفي كذا احسن
                  // ماكنت بوديه بس بطبع الماب .iiiiiiii
                  // item builder فيه index
                  // يعني بيلف على اللست كلها وبيعرض الايتم نفسه داخل البوكس الي بنسويه
                  itemBuilder: (context, index) {
                    // حق نسهل لنفسنا نحفظ الماب الحالي في ماب ثاني
                    Map<String, dynamic> currentPlayer = playersList[index];
                    // حسيت شرحي هنا معقد بس بتشوفين كيف لما يشتغل الكود
                    //"Image": "http://via.placeholder.com/70x70",
                    // "Name": "سواق ابتهال",
                    // "POS": "سواق طبعا",
                    // بس كذا بيطلع باسهل طريقة
                    // بعدل على الديزاين بس اول بعرضه حق تشوفين
                    // اعظم ايرور
                    // ليش؟ لان ماعططيناه المساحه الي يطلع فيها كيف اعطيه
                    // طريقتين يا يكوون داخل Expanded Widget
                    // ععشان ياخذ كل المساحة الي يبيها بس
                    // او نحدد له الارتفاح الي نبيه احنا
                    // بما انا بسويه من يمين ليسار فبحدد ارتفاع
                    return GestureDetector(
                      onTap: () {
                        log(currentPlayer.toString());
                      },
                      // تقربا كذا بيكون الكارد مع شوي ستايل للخط والكلام
                      // ونخلي الصوره تملا البكس
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.width * 0.3,
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Builder(builder: (context) {
                                  String image = currentPlayer['Image'];
                                  if (image.contains('http')) {
                                    return Image.network(
                                      currentPlayer['Image'],
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      // height:
                                      //     MediaQuery.of(context).size.width *
                                      //         0.2,
                                      fit: BoxFit.contain,
                                    );
                                  } else {
                                    return Image.asset(
                                      currentPlayer['Image'],
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                      fit: BoxFit.contain,
                                    );
                                  }
                                }),
                              ),
                              Text(currentPlayer['POS'] ?? ""),
                              Text(currentPlayer['Name'] ?? ""),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
