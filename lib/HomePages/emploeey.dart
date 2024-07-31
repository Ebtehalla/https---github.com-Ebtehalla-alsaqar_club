// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:alsagr_app/components/drawer.dart';
import 'package:alsagr_app/data_sources/emploeey_apis.dart';
import 'package:alsagr_app/pages/homepage.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

import '../core/extensions/validator.dart';
import '../firebase_helper.dart';
import '../models/emploeey_model.dart';

class Emploeeykey extends StatefulWidget {
  const Emploeeykey({super.key});

  @override
  State<Emploeeykey> createState() => _EmploeeykeyState();
}

class _EmploeeykeyState extends State<Emploeeykey> {
  var fullNameController = TextEditingController();
  var idNumberController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var ageController = TextEditingController();
  File? cvFile;
  String? imagePath;
  String? img;
  @override
  void initState() {
    super.initState();
    getImage();
  }

  void getImage() async {
    img = await getImageByType("image_career");

    print(imagePath.toString());
    setState(() {
      imagePath = img;
    });
  }

  Future<String> getImageByType(String uid) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('Images')
        .where('image_type', isEqualTo: "image_career")
        .get();
    return snapshot.docs.first["image_url"];
  }

  GlobalKey<FormState> emploeeyFormKey = GlobalKey<FormState>();
  Future emploeeykey({
    required String name,
    required String email,
    required String phone,
    required String age,
  }) async {
    BotToast.showLoading();
    var imageUrl = await FirebaseStorageHelper.uploadFileToFirebaseStorage(
        file: cvFile!, uid: name, collection: email);
    bool? res = await EmploeeyApis.addMessageToFirestore(
      EmploeeyModel(
        email: email,
        name: name,
        phone: phone,
        age: age,
        cv: imageUrl ?? "",
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
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text(
          ' الوظائف  ',
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
      body: SingleChildScrollView(
        // Wrap the body content with SingleChildScrollView
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: emploeeyFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    ' وظائف شاغرة',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  if (imagePath != null)
                    Image(
                      image: NetworkImage(imagePath.toString()),
                      width: 500,
                      height: 400,
                    ),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: fullNameController,
                    validator: Validator.validateName,
                    decoration: const InputDecoration(
                      labelText: 'الأسم الثلاثي',
                    ),
                  ),
                  TextFormField(
                    controller: idNumberController,
                    keyboardType: TextInputType.number,
                    validator: Validator.validateName,
                    decoration: const InputDecoration(
                      labelText: 'رقم الهوية ',
                    ),
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.number,
                    validator: Validator.validateName,
                    decoration: const InputDecoration(
                      labelText: ' رقم الجوال',
                    ),
                  ),
                  TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return "لا يجب ان يكون العمر فارغا";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: ' العمر',
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (emploeeyFormKey.currentState!.validate() &&
                          cvFile != null) {
                        emploeeykey(
                          name: fullNameController.text,
                          email: idNumberController.text,
                          phone: phoneNumberController.text,
                          age: ageController.text,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(
                          131, 40, 117, 1.000), // Set the desired color here
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20), // Adjust the padding here
                      textStyle: const TextStyle(
                          fontSize: 18), // Adjust the font size here
                    ),
                    child: const Text('إرسال'),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf', 'doc', 'docx'],
                      );
                      if (result != null) {
                        PlatformFile file = result.files.first;
                        String filePath = file.path!;

                        setState(() {
                          cvFile = File(filePath);
                        });
                      } else {
                        // User canceled the file picking
                        print('File picking canceled.');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(
                          8.0), // Adjust the padding value as needed
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the border radius as needed
                        child: const Text(
                          'إضافة ملف السيرة الذاتية',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            backgroundColor:
                                Color.fromRGBO(215, 172, 78, 1.000),
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
