import 'package:alsagr_app/components/drawer.dart';
import 'package:alsagr_app/data_sources/audience_poll_apis.dart';

import 'package:alsagr_app/models/audience_poll_model.dart';
import 'package:alsagr_app/models/opinion_poll_model.dart';
import 'package:alsagr_app/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:uuid/uuid.dart';

class SurveyScreen extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  SurveyScreen({super.key});
  List<OpinionPoll> opinions = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'أستطلاع الجمهور',
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
                  'نأمل منكم الإجابة على الأسئلة لمعرفة انطباعكم عن أداء النادي',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(215, 172, 78, 1.000),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  '1. الجنس',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(131, 40, 117, 1.000),
                  ),
                ),
                FormBuilderRadioGroup(
                  name: '1. الجنس',
                  options: const [
                    FormBuilderFieldOption(value: 'ذكر'),
                    FormBuilderFieldOption(value: 'أنثى')
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
                    color: Color.fromRGBO(131, 40, 117, 1.000),
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
                  '3. مكان الإقامة الحالي',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(131, 40, 117, 1.000),
                  ),
                ),
                FormBuilderRadioGroup(
                  name: '3. مكان الإقامة الحالي',
                  options: const [
                    FormBuilderFieldOption(value: 'منطقة القصيم'),
                    FormBuilderFieldOption(value: 'خارج منطقة القصيم'),
                    FormBuilderFieldOption(value: 'خارج المملكة')
                  ],
                  onSaved: (newValue) {
                    opinions.add(OpinionPoll(
                        id: 3,
                        question: " '3. مكان الإقامة الحالي'",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '4. يقوم النادي بتسويق المباريات عبر وسائل التواصل الاجتماعي والأماكن العامة',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(131, 40, 117, 1.000),
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
                        question:
                            " '4. يقوم النادي بتسويق المباريات عبر وسائل التواصل الاجتماعي والأماكن العامة'",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '5. الأنشطة التسويقية التي يقوم بها النادي لجذب الجماهير لحضور المباريات كافية',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(131, 40, 117, 1.000),
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
                        question:
                            "'5. الأنشطة التسويقية التي يقوم بها النادي لجذب الجماهير لحضور المباريات كافية' ",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '6. ما مدى رضاك عن تنظيم المباراة من حيث (تنظيم دخول وخروج الجماهير - توزيع المنظمين داخل المدرجات - توفر اللوحات الارشادية)',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(131, 40, 117, 1.000),
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
                        question:
                            "'6. ما مدى رضاك عن تنظيم المباراة من حيث (تنظيم دخول وخروج الجماهير - توزيع المنظمين داخل المدرجات - توفر اللوحات الارشادية)' ",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '7.يلتزم النادي بمعايير الأمان .',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(131, 40, 117, 1.000),
                  ),
                ),
                FormBuilderRadioGroup(
                  name:
                      '7. يلتزم النادي بمعايير الأمانا آسف و لكن ليس لدي توجه نحو لغة معينة. إذا كنت تحتاج إلى مساعدة بخصوص شيء معين، يسعدني أن أساعدك.',
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
                        question: " '7.يلتزم النادي بمعايير الأمان .'",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '8. يستهدف النادي فئات مختلفة من المجتمع عند إقامة الأنشطة الترفيهية والفعاليات',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(131, 40, 117, 1.000),
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
                            "'8. يستهدف النادي فئات مختلفة من المجتمع عند إقامة الأنشطة الترفيهية والفعاليات' ",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '9. تنوع الأطعمة والمشروبات المقدمة من النادي خلال الأنشطة والفعاليات',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(131, 40, 117, 1.000),
                  ),
                ),
                FormBuilderRadioGroup(
                  name:
                      '9. تنوع الأطعمة والمشروبات المقدمة من النادي خلال الأنشطة والفعاليات',
                  options: const [
                    FormBuilderFieldOption(value: 'غير موافق بشدة'),
                    FormBuilderFieldOption(value: 'غير موافق'),
                    FormBuilderFieldOption(value: 'موافق نوعاً ما'),
                    FormBuilderFieldOption(value: 'موافق'),
                    FormBuilderFieldOption(value: 'موافق بشدة')
                  ],
                  onSaved: (newValue) {
                    opinions.add(OpinionPoll(
                        id: 9,
                        question:
                            "'9. تنوع الأطعمة والمشروبات المقدمة من النادي خلال الأنشطة والفعاليات' ",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '10. وسائل التواصل الاجتماعي تغطي أحداث مباريات النادي',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(131, 40, 117, 1.000),
                  ),
                ),
                FormBuilderRadioGroup(
                  name: '10. وسائل التواصل الاجتماعي تغطي أحداث مباريات النادي',
                  options: const [
                    FormBuilderFieldOption(value: 'غير موافق بشدة'),
                    FormBuilderFieldOption(value: 'غير موافق'),
                    FormBuilderFieldOption(value: 'موافق نوعاً ما'),
                    FormBuilderFieldOption(value: 'موافق'),
                    FormBuilderFieldOption(value: 'موافق بشدة')
                  ],
                  onSaved: (newValue) {
                    opinions.add(OpinionPoll(
                        id: 10,
                        question:
                            "'10. وسائل التواصل الاجتماعي تغطي أحداث مباريات النادي' ",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '11. يستخدم النادي الموقع الإلكتروني الرسمي في الإعلان عن المباريات القادمة',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(131, 40, 117, 1.000),
                  ),
                ),
                FormBuilderRadioGroup(
                  name:
                      '11. يستخدم النادي الموقع الإلكتروني الرسمي في الإعلان عن المباريات القادمة',
                  options: const [
                    FormBuilderFieldOption(value: 'نعم'),
                    FormBuilderFieldOption(value: 'لا'),
                    FormBuilderFieldOption(value: 'لا أعلم')
                  ],
                  onSaved: (newValue) {
                    opinions.add(OpinionPoll(
                        id: 11,
                        question:
                            " '11. يستخدم النادي الموقع الإلكتروني الرسمي في الإعلان عن المباريات القادمة'",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '12. ما مدى رضاك عن مستوى أداء اللاعبين المحليين في المباراتين السابقتين',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(131, 40, 117, 1.000),
                  ),
                ),
                FormBuilderRadioGroup(
                  name:
                      '12. ما مدى رضاك عن مستوى أداء اللاعبين المحليين في المباراتين السابقتين',
                  options: const [
                    FormBuilderFieldOption(value: 'ممتاز'),
                    FormBuilderFieldOption(value: 'جيد جداً'),
                    FormBuilderFieldOption(value: 'مقبول'),
                    FormBuilderFieldOption(value: 'ضعيف')
                  ],
                  onSaved: (newValue) {
                    _formKey
                        .currentState
                        ?.fields[
                            '12. ما مدى رضاك عن مستوى أداء اللاعبين المحليين في المباراتين السابقتين']
                        ?.didChange(newValue);
                    opinions.add(OpinionPoll(
                        id: 12,
                        question:
                            "'12. ما مدى رضاك عن مستوى أداء اللاعبين المحليين في المباراتين السابقتين'",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '13. ما مدى رضاك عن مستوى أداء الجهاز الفني والإداري للفريق الأول في المباراتين السابقتين',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(131, 40, 117, 1.000),
                  ),
                ),
                FormBuilderRadioGroup(
                  name:
                      '13. ما مدى رضاك عن مستوى أداء الجهاز الفني والإداري للفريق الأول في المباراتين السابقتين',
                  options: const [
                    FormBuilderFieldOption(value: 'ممتاز'),
                    FormBuilderFieldOption(value: 'جيد جداً'),
                    FormBuilderFieldOption(value: 'مقبول'),
                    FormBuilderFieldOption(value: 'ضعيف')
                  ],
                  onSaved: (newValue) {
                    opinions.add(OpinionPoll(
                        id: 13,
                        question:
                            " '13. ما مدى رضاك عن مستوى أداء الجهاز الفني والإداري للفريق الأول في المباراتين السابقتين'",
                        selection: newValue ?? ""));
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  '14. ماهي مقترحاتك لتطوير أداء النادي؟',
                  style: TextStyle(
                    fontSize: 17, // تحديد حجم النص هنا
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(131, 40, 117, 1.000),
                  ),
                ),
                FormBuilderTextField(
                  name: '14. ماهي مقترحاتك لتطوير أداء النادي؟',
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'مقترحات',
                    border: OutlineInputBorder(),
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
                      await AudiencePollApis.addMessageToFirestore(audiancePoll)
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
                  child: const Center(child: Text('إرسال')),
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
