import 'package:alsagr_app/components/my_glass_card.dart';
import 'package:flutter/material.dart';
import 'package:alsagr_app/components/drawer.dart';

// ignore: camel_case_types
class Goalsclub extends StatefulWidget {
  const Goalsclub({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GoalsclubState createState() => _GoalsclubState();
}

class _GoalsclubState extends State<Goalsclub> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        actions: [
          ClipOval(
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'assets/112.png',
              width: 10, // تحديد عرض الصورة
              height: 10, // تحديد ارتفاع الصورة
              fit: BoxFit.cover, // تحديد كيفية تلائم الصورة داخل الحجم المحدد
            ),
          ),
        ],
        title: const Text(
          ' الاهداف الاستراتيجية ومبادراتها',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
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
                    child: ListView(
                      // padding: const EdgeInsets.symmetric(
                      //     vertical: 20.0, horizontal: 30.0),
                      children: const [
                        Center(
                          child: Column(
                            children: [
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Text(
                                  'تطوير البناء المؤسسي :',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(131, 40, 117, 1.000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10.0),

                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            'يسعى النادي إلى حوكمة كافة الأعمال الإدارية بما يتماشى مع اللوائح والأنظمة والاجراءات المعتمدة من وزارة الرياضة,وتحويل المعاملات الورقية الى معاملات إلكترونية من خلال الحوكمة الرقمية وتوفير بنية تحتية ومرافق متكاملة لكافة اصحاب المصلحة الداخليين والخارجيين .',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '  -مبادرات النادي لتحقيق الأهداف  : ',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(131, 40, 117, 1.000),
                            ),
                          ),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(255, 146, 146, 146),
                                width: 0.6,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                          width: 0.3,
                        ), // Add spacing between the additional text and the new text
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '1- الحوكمة الإدارية الفعالة',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '2- التحول الرقمي للنادي',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '3- تجهيز مرافق النادي ورفع الكفاءة التشغيلية',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        SizedBox(height: 40.0),
                        SizedBox(
                            height:
                                5.0), // Add spacing between the text and the line
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(255, 34, 33, 33),
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              'تعزيز الاستدامة المالية : ',
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
                            ' يسعى النادي لتنمية موارده المالية لتحقيق تطلعاته في المجالين الرياضي وغير الرياضي من خلال رفع استثماراته الذاتية وزيادة عدد الرعاة والمعلنين ,والإدارة الفاعلة لهذة الموارد المالية وتخصيصها وفقا لأولويات النادي لتحقيق كفاءة الإنفاق.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '  -مبادرات النادي لتحقيق الأهداف  : ',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(131, 40, 117, 1.000),
                            ),
                          ),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(255, 146, 146, 146),
                                width: 0.6,
                              ),
                            ),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '1- تعزيز قيمة العلامة التجارية للنادي',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '2- استثمار ممتلكات النادي وأصوله',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '3- استقطاب الرعاة والمعلنين والداعمين',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),

                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '4-تحسين كفاءة الإنفاق ',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),

                        SizedBox(height: 40.0, width: 20.0),
                        SizedBox(
                            height:
                                5.0), // Add spacing between the text and the line
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(255, 34, 33, 33),
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Text(
                              'تجويد العلاقة مع أصحاب المصلحة :',
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
                            'يسعى النادي لبناء علاقات مميزة مع الأطراف ذوي العلاقة بأنشطة النادي الرياضية وغير الرياضية وعلى رأسهم وزارة الرياضية والاتحادات ,وشركات الرعاية والإعلان , ومنسوبو النادي من إلاداريين واللاعبين والمدربين , وجماهير النادي, وكافة النادي , وكافة اصحاب المصلحة الأخرون.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '  -مبادرات النادي لتحقيق الأهداف  : ',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(131, 40, 117, 1.000),
                            ),
                          ),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(255, 146, 146, 146),
                                width: 0.6,
                              ),
                            ),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '1- المشاركة الفعالة في مبادرات الوزارة والاتحادات الرياضية',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '2- تنفيذ برامج مشتركة مع الرعاة والمعلنين والداعمين ',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '3- التواصل الفعال مع منسوبي النادي',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '4- تنويع الفعاليات الترفيهية',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '5-تعزيز الأتصال والحضور الإعلامي ',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '6-تعزيز المشاركة المجتمعية  ',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '7-زيادة الحضور الجماهيري للمباريات ',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        SizedBox(height: 40.0, width: 20.0),
                        SizedBox(
                            height:
                                5.0), // Add spacing between the text and the line
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(255, 34, 33, 33),
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: SizedBox(
                              child: Text(
                                ' تحسين التنافسية الرياضية :',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(131, 40, 117, 1.000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            ' يسعى النادي لتعزيز تنافسية في لعبة كرة القدم والصعود بالفريق الأول إلى دوري الدرجة الأولى ,وتفعيل عدد من الألغاب المختلفة بما يتماشى من توجهات وزارة الرياضة ويسهم في تحقيق تطلعات المنطقة.',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '  -مبادرات النادي لتحقيق الأهداف  : ',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(131, 40, 117, 1.000),
                            ),
                          ),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Color.fromARGB(255, 146, 146, 146),
                                width: 0.6,
                              ),
                            ),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '1-استقطاب اللاعبين المميزين',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '2-استقطاب المواهب السنية',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '3-استقطاب المدربين المميزين  ',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '4-تفعيل أكاديمية النادي ',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '5-توفير الرعاية الصحية للاعبين ',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            '6-إقامة المعسكرات التحضيرية ',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                        SizedBox(height: 28.0),
                      ],
                    ),
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
