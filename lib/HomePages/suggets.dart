import 'package:alsagr_app/components/drawer.dart';
import 'package:alsagr_app/data_sources/suggest_apis.dart';
import 'package:alsagr_app/models/suggest_model.dart';
import 'package:alsagr_app/pages/homepage.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/extensions/validator.dart';

class Problem extends StatefulWidget {
  const Problem({super.key});

  @override
  State<Problem> createState() => _ProblemState();
}

class _ProblemState extends State<Problem> {
  var fullNameController = TextEditingController();
  var subjectController = TextEditingController();
  var messageController = TextEditingController();
  var TypeOfRequestController = TextEditingController();
  GlobalKey<FormState> suggestFormKey = GlobalKey<FormState>();

  void _openSocialMedia(String url) async {
    if (await canLaunchUrl(
      Uri.parse(url),
    )) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future suggest({
    required String name,
    required String subject,
    required String message,
    required String TypeOfRequest,
  }) async {
    bool? res = await SuggestApis.addMessageToFirestore(
      SuggestModel(
        name: name,
        subject: subject,
        message: message,
        TypeOfRequest: TypeOfRequest,
      ),
    );
    if (res) {
      BotToast.closeAllLoading();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(
              title: 'نادي الصقر',
              imagePath: '',
            ),
          ));
      BotToast.showText(
        text: "تم إرسال رسالتك بنجاح سيتم التواصل معك قريبا",
      );
    } else {
      BotToast.closeAllLoading();

      BotToast.showText(
        text: "حدث خطأ اثناء إرسال رسالتك حاول مرة اخري",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'البلاغات والشكاوي',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: suggestFormKey,
          child: Column(
            children: [
              const Text(
                'الشكاوي والأقتراحات',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: fullNameController,
                validator: Validator.validateName,
                decoration: InputDecoration(
                  hintText: 'أدخل  اسمك',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        20), // Set the desired border radius here
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: subjectController,
                validator: Validator.validateEmpty,
                decoration: InputDecoration(
                  hintText: '  الموضوع',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        20), // Set the desired border radius here
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: TypeOfRequestController,
                validator: Validator.validateEmpty,
                decoration: InputDecoration(
                  hintText: '  نوع الطلب',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        20), // Set the desired border radius here
                  ),
                ),
              ),
              const SizedBox(height: 26),
              TextFormField(
                controller: messageController,
                validator: Validator.validateEmpty,
                decoration: InputDecoration(
                  hintText: '  رسالتك',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        20), // Set the desired border radius here
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  if (suggestFormKey.currentState!.validate()) {
                    suggest(
                      name: fullNameController.text,
                      subject: subjectController.text,
                      TypeOfRequest: TypeOfRequestController.text,
                      message: messageController.text,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(
                      215, 172, 78, 1.000), // Set the desired color here
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 20), // Adjust the padding here
                  textStyle: const TextStyle(
                      fontSize: 18), // Adjust the font size here
                ),
                child: const Text('إرسال'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
