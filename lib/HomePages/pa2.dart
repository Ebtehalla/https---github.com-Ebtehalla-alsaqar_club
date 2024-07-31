import 'package:alsagr_app/components/drawer.dart';
import 'package:alsagr_app/models/audience_poll_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:uuid/uuid.dart';

import '../data_sources/audience_poll_apis.dart';
import '../models/opinion_poll_model.dart';
import '../pages/homepage.dart';

class PageVisit extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  PageVisit({super.key});
  List<OpinionPoll> opinions = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'أستطلاع الزوار',
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
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'استبيان الزوار يهدف هذا الاستبيان إلى إتاحة الفرصة لزوار نادي الصقر السعودي لإبداء آرائهم عن مرافق النادي بهدف التحسين والتطوير، علمًا بأن المعلومات المقدمة ستبقى سريّة.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(215, 172, 78, 1.000),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  '1. الجنس ',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color:
                        Color.fromRGBO(131, 40, 117, 1.000), // تحديد لون النص ه
                  ),
                ),
                FormBuilderRadioGroup(
                  name: '1. الجنس',
                  options: const [
                    FormBuilderFieldOption(value: 'ذكر '),
                    FormBuilderFieldOption(value: ' انثى'),
                  ],
                  onSaved: (newValue) {
                    opinions.add(OpinionPoll(
                        id: 1,
                        question: "'1. الجنس'",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '2. العمر',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color:
                        Color.fromRGBO(131, 40, 117, 1.000), // تحديد لون النص ه
                  ),
                ),
                FormBuilderRadioGroup(
                  name: '2. العمر',
                  options: const [
                    FormBuilderFieldOption(value: 'أقل من 20 سنة'),
                    FormBuilderFieldOption(value: 'من 20 إلى أقل من 30 سنة'),
                    FormBuilderFieldOption(value: 'من 30 إلى أقل من 50 سنة'),
                    FormBuilderFieldOption(value: 'من 50 سنة فأعلى')
                  ],
                  onSaved: (newValue) {
                    opinions.add(OpinionPoll(
                        id: 2,
                        question: " '2. العمر'",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '3. أعمال الصيانة بمنشأة النادي واضحة للزوار',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color:
                        Color.fromRGBO(131, 40, 117, 1.000), // تحديد لون النص ه
                  ),
                ),
                FormBuilderRadioGroup(
                  name: '3. مكان الإقامة الحالي',
                  options: const [
                    FormBuilderFieldOption(value: 'غير موافق بشدة'),
                    FormBuilderFieldOption(value: 'غير موافق'),
                    FormBuilderFieldOption(value: 'موافق نوعاً ما'),
                    FormBuilderFieldOption(value: 'موافق'),
                    FormBuilderFieldOption(value: 'موافق بشدة')
                  ],
                  onSaved: (newValue) {
                    opinions.add(OpinionPoll(
                        id: 3,
                        question:
                            " '3. أعمال الصيانة بمنشأة النادي واضحة للزوار'",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '4. الانطباع العام عن الزيارة',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color:
                        Color.fromRGBO(131, 40, 117, 1.000), // تحديد لون النص ه
                  ),
                ),
                FormBuilderRadioGroup(
                  name:
                      '4. يقوم النادي بتسويق المباريات عبر وسائل التواصل الاجتماعي والأماكن العامة',
                  options: const [
                    FormBuilderFieldOption(value: 'غير موافق بشدة'),
                    FormBuilderFieldOption(value: 'غير موافق'),
                    FormBuilderFieldOption(value: 'موافق نوعاً ما'),
                    FormBuilderFieldOption(value: 'موافق'),
                    FormBuilderFieldOption(value: 'موافق بشدة')
                  ],
                  onSaved: (newValue) {
                    opinions.add(OpinionPoll(
                        id: 4,
                        question: "'4. الانطباع العام عن الزيارة'",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '5. يوجد بمنشأة النادي مصلى مناسب',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color:
                        Color.fromRGBO(131, 40, 117, 1.000), // تحديد لون النص ه
                  ),
                ),
                FormBuilderRadioGroup(
                  name:
                      '5. الأنشطة التسويقية التي يقوم بها النادي لجذب الجماهير لحضور المباريات كافية',
                  options: const [
                    FormBuilderFieldOption(value: 'غير موافق بشدة'),
                    FormBuilderFieldOption(value: 'غير موافق'),
                    FormBuilderFieldOption(value: 'موافق نوعاً ما'),
                    FormBuilderFieldOption(value: 'موافق'),
                    FormBuilderFieldOption(value: 'موافق بشدة')
                  ],
                  onSaved: (newValue) {
                    opinions.add(OpinionPoll(
                        id: 5,
                        question: "'5. يوجد بمنشأة النادي مصلى مناسب'",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '6.  موقع النادي مناسب للزوار',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color:
                        Color.fromRGBO(131, 40, 117, 1.000), // تحديد لون النص ه
                  ),
                ),
                FormBuilderRadioGroup(
                  name:
                      '6. ما مدى رضاك عن تنظيم المباراة من حيث (تنظيم دخول وخروج الجماهير - توزيع المنظمين داخل المدرجات - توفر اللوحات الارشادية)',
                  options: const [
                    FormBuilderFieldOption(value: 'راضي جداً'),
                    FormBuilderFieldOption(value: 'راضي'),
                    FormBuilderFieldOption(value: 'غير راضي'),
                    FormBuilderFieldOption(value: 'غير راضي جداً'),
                    FormBuilderFieldOption(value: 'محايد')
                  ],
                  onSaved: (newValue) {
                    opinions.add(OpinionPoll(
                        id: 6,
                        question: "'6.  موقع النادي مناسب للزوار'",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '7. يلتزم النادي بمعايير الأمانا آسف و لكن ليس لدي توجه نحو لغة معينة. إذا كنت تحتاج إلى مساعدة بخصوص شيء معين، يسعدني أن أساعدك.',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color:
                        Color.fromRGBO(131, 40, 117, 1.000), // تحديد لون النص ه
                  ),
                ),
                FormBuilderRadioGroup(
                  name: '7.يلتزم النادي بمعايير الأمان .',
                  options: const [
                    FormBuilderFieldOption(value: 'راضي جداً'),
                    FormBuilderFieldOption(value: 'راضي'),
                    FormBuilderFieldOption(value: 'غير راضي'),
                    FormBuilderFieldOption(value: 'غير راضي جداً'),
                    FormBuilderFieldOption(value: 'محايد')
                  ],
                  onSaved: (newValue) {
                    opinions.add(OpinionPoll(
                        id: 7,
                        question:
                            "'7. يلتزم النادي بمعايير الأمانا آسف و لكن ليس لدي توجه نحو لغة معينة. إذا كنت تحتاج إلى مساعدة بخصوص شيء معين، يسعدني أن أساعدك.'",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '8.اللوحات الإرشادية ووسائل السلامة متوفرة بصورة كافية',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color:
                        Color.fromRGBO(131, 40, 117, 1.000), // تحديد لون النص ه
                  ),
                ),
                FormBuilderRadioGroup(
                  name:
                      '8. يستهدف النادي فئات مختلفة من المجتمع عند إقامة الأنشطة الترفيهية والفعاليات',
                  options: const [
                    FormBuilderFieldOption(value: 'غير موافق بشدة'),
                    FormBuilderFieldOption(value: 'غير موافق'),
                    FormBuilderFieldOption(value: 'موافق نوعاً ما'),
                    FormBuilderFieldOption(value: 'موافق'),
                    FormBuilderFieldOption(value: 'موافق بشدة')
                  ],
                  onSaved: (newValue) {
                    opinions.add(OpinionPoll(
                        id: 8,
                        question:
                            "'8.اللوحات الإرشادية ووسائل السلامة متوفرة بصورة كافية'",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '. ماهي مقترحاتك لتطوير أداء النادي؟',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color:
                        Color.fromRGBO(131, 40, 117, 1.000), // تحديد لون النص ه
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    // call api to post information to, if success = clear fields show success msg, false show faild msg & don't clear fields
                    bool sent = true; // نتيجة تسليم الفورم
                    _formKey.currentState?.save();
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      print(opinions);
                      final AudiancePoll audiancePoll = AudiancePoll(
                          id: const Uuid().v8(), polls: opinions, message: "");
                      await VistorsPollApis.addMessageToFirestore(audiancePoll)
                          .then((value) {
                        opinions.clear();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              const HomePage(title: "", imagePath: ""),
                        ));
                        return ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("تم ارسال البيانات بنجاح")));
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("تم ارسال البيانات بنجاح")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(
                        215, 172, 78, 1.000), // Set the desired color here
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 20), // Adjust the padding here
                    textStyle: const TextStyle(
                        fontSize: 18), // Adjust the font size here
                  ),
                  child: const Text('إرسال'),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
