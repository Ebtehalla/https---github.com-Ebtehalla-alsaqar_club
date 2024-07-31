import 'package:alsagr_app/components/my_glass_card.dart';
import 'package:flutter/material.dart';
import 'package:alsagr_app/components/drawer.dart';

class ClubVision extends StatefulWidget {
  const ClubVision({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ClubVisionState createState() => _ClubVisionState();
}

class _ClubVisionState extends State<ClubVision> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text(
          'رؤية نادي الصقر',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        actions: [
          ClipOval(
            child: Image.asset(
              'assets/112.png',
              height: 100,
              width: 60,
            ),
          ),
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
      backgroundColor: const Color.fromARGB(255, 247, 249, 247),
      body: Stack(
        children: [
          Image.asset(
            'assets/vision.jpg',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: Column(
              children: [
                Expanded(
                  child: GlassCard(
                    context: context,
                    fullSize: true,

                    gcHieght: MediaQuery.of(context).size.width * 0.9,
                    gcWidth: MediaQuery.of(context).size.width * 0.9,
                    child: const Column(
                      // padding: const EdgeInsets.symmetric(
                      //     vertical: 20.0, horizontal: 30.0),
                      children: [
                        Center(
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              ' رؤية نادي الصقر السعودي',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(131, 40, 117, 1.000),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 10.0),

                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            'ان نكون ضمن الخمس اندية الرياضية المتميزة في الدوري منافسين في الالعاب المختلفة , مساهمين في خدمة مجتمعنا , خلال الخمس سنوات.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            'ضمن الخمس أندية مميزة : في المراتب المتقدم في منافسة كرة القدم ومستقر فنيا وإداريا وماليا',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        SizedBox(
                            height:
                                5.0), // Add spacing between the text and the line
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(255, 146, 146, 146),
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'رسالة النادي',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(131, 40, 117, 1.000),
                            ),
                          ),
                        ),

                        SizedBox(height: 10.0),

                        Text(
                          'أن نكون نموذجا متميزا للرياضة السعودية من خلال التطوير المؤسسي , وتطوير المنشآت والمرافق , وضمان الاستدامة المالية وتعزيز دور النادي المجتمعي , لتحقيق طموحات الشركاء.',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 16.0),
                        ),

                        SizedBox(
                          height: 40.0,
                          width: 20.0,
                        ),
                        SizedBox(
                            height:
                                5.0), // Add spacing between the text and the line
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(255, 146, 146, 146),
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              'القيم',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(131, 40, 117, 1.000),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            'في سعي النادي في أن يكون متميزاً , فإنه يعمل على غرس القيم والمبادئ الإسلامية والإنسانية في نفوس منسوبيه وشركائه , بما يخلق بيئة تنافسية جاذبة.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        SizedBox(
                            height:
                                20.0), // إضافة فراغ إضافي في الأسفل لتجنب عدم ظهور آخر النصوص عند التمرير
                      ],
                    ),
                    // const Text(
                    //   'تاسس نادي الصقر عام 1401هـ على يد مجموعة من اهالي مركز البصر وحينها تم ترشيح الاستاذ عبد العزيز بن عبد الرحمن السويد كاول رئيس للنادي, ثم تعاقب على ادارة النادي احد عشر رئيسا كان اخرهم الرئيس الحالي الاستاذ فهد بن عبد العزيز المحيميد.حقق النادي اول بطولاته على مستوى منطقة القصيم العام 1432هـ وفي العام 1442هـ حقق النادي ذات البطولة للمرة الثانية . وفي نفس العام حقق نادي الصقر تاج بطولاتة : درع المملكة العربية السعودية الاندية الدرجة الثالثة, بقيادة رئيس النادي الاستاذ فهد بن عبدالعزيز المحيميد, وعلى اثرها تأهل لاول مرة في تاريخه لدوري الدرجة الثانية لكرة القدم .',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 17,
                    //     color: Colors.black87,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
