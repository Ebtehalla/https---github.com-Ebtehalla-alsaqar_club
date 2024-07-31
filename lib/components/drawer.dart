// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:alsagr_app/HomePages/emploeey.dart';
import 'package:alsagr_app/HomePages/golas.dart';
import 'package:alsagr_app/HomePages/pa1.dart';
import 'package:alsagr_app/HomePages/pa2.dart';
import 'package:alsagr_app/HomePages/pag3.dart';
import 'package:alsagr_app/HomePages/rowaa_club.dart';
import 'package:alsagr_app/HomePages/suggets.dart';
import 'package:alsagr_app/club_vision.dart';
import 'package:alsagr_app/components/pdf_screen.dart';
import 'package:alsagr_app/pages/news.dart';
import 'package:alsagr_app/pages/contact.dart';
import 'package:alsagr_app/pages/homepage.dart';
import 'package:alsagr_app/pages/shcule_sport.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'org_structure_screen.dart';

class MyDrawer extends StatefulWidget {
  List<GlobalKey>? keys;
  MyDrawer({super.key, this.keys});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Image.asset(
                        'assets/logonewtow.png',
                        height: MediaQuery.of(context).size.width * 0.3,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                ],
              ),
              // Body
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.keys != null
                        ? myExpandedWidget(
                            context,
                            'الرئيسية',
                            [
                              GestureDetector(
                                onTap: () =>
                                    navigateToKey(context, widget.keys, 0),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Text('اللاعبين'),
                                      const SizedBox(height: 12),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(
                                              () => const OrgStrctureScreeen());
                                        },
                                        child: const Text('الهيكل التنظيمي'),
                                      ),
                                      const SizedBox(height: 12),
                                      GestureDetector(
                                        onTap: () => navigateToKey(
                                            context, widget.keys, 2),
                                        child: const Text('المباراة القادمة'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                            EneftyIcons.home_outline,
                          )
                        : const MyListTile(
                            title: ' الرئيسية ',
                            icon: EneftyIcons.home_outline,
                            screenName: HomePage(
                              title: 'نادي الصقر',
                              imagePath: '',
                            ),
                          ),
                    const SizedBox(height: 20),
                    const MyListTile(
                      title: ' نبذة التاريخية ',
                      icon: EneftyIcons.information_outline,
                      screenName: roawaacl(),
                    ),
                    const SizedBox(height: 20),
                    const MyListTile(
                      title: 'الاخبار',
                      icon: EneftyIcons.book_2_outline,
                      screenName: NewsPage(),
                    ),
                    const SizedBox(height: 20),
                    const MyListTile(
                      title: 'جدول المباريات',
                      icon: Icons.sports_volleyball_outlined,
                      screenName: Sportclander(), // بدلي الصفحات حقها بعدين
                    ),
                    const SizedBox(height: 20),
                    myExpandedWidget(
                      context,
                      'الإستراتيجية',
                      [
                        const MyListTile(
                          title: 'رؤية النادي ورسالته',
                          icon: Icons.message_sharp,
                          screenName: ClubVision(), // بدلي الصفحات حقها بعدين
                        ),
                        const SizedBox(height: 12),
                        const MyListTile(
                          title: 'الاهداف الإستراتيجية',
                          icon: Icons.grading_outlined,
                          screenName: Goalsclub(), // بدلي الصفحات حقها بعدين
                        ),
                        const SizedBox(height: 12),
                        const MyListTile(
                          title: 'وثيقة الخطة الإستراتيجية',
                          icon: Icons.format_list_bulleted,
                          screenName: PdfScreen(
                            pdf:
                                "https://firebasestorage.googleapis.com/v0/b/alsaqar-566d3.appspot.com/o/%D8%A7%D8%B3%D8%AA%D8%B1%D8%A7%D8%AA%D9%8A%D8%AC%D9%8A%D8%A9%20%D8%A7%D9%84%D9%86%D8%A7%D8%AF%D9%8A%20%D8%A7%D9%84%D8%B1%D8%B3%D9%85%D9%8A%D8%A9.pdf?alt=media&token=d3ccf571-d802-4795-b22f-16c3fd7d10f7",
                            title: 'وثيقة الخطة الإستراتيجية',
                          ),
                        ),
                        const SizedBox(height: 12),
                        const MyListTile(
                          title: "التقرير السنوي",
                          icon: Icons.format_list_bulleted,
                          screenName: PdfScreen(
                            pdf:
                                "https://firebasestorage.googleapis.com/v0/b/alsaqar-566d3.appspot.com/o/%E2%80%8E%E2%81%A8%D8%A7%D9%84%D8%AA%D9%82%D8%B1%D9%8A%D8%B1%20%D8%A7%D9%84%D8%B3%D9%86%D9%88%D9%8A%E2%81%A9.pdf?alt=media&token=8a2d4867-4c65-4e1e-bc42-ad3d84699929&_gl=1*j2d53l*_ga*OTQ2NzAzNTcyLjE2OTkwOTY0MTI.*_ga_CW55HF8NVT*MTY5OTA5NjQxMS4xLjEuMTY5OTA5NzExMS4yMC4wLjA",
                            title: "التقرير السنوي",
                          ),
                        ),
                      ],
                      EneftyIcons.diagram_outline,
                    ),
                    const SizedBox(height: 20),
                    myExpandedWidget(
                      context,
                      'الاستطلاعات',
                      [
                        MyListTile(
                          title: 'استطلاع الجمهور',
                          icon: Icons.poll,
                          screenName: SurveyScreen(), // بدلي الصفحات حقها بعدين
                        ),
                        const SizedBox(height: 12),
                        // MyListTile(
                        //   title: 'استطلاع الموظفين',
                        //   icon: Icons.group,
                        //   screenName: PageEmplo(), // بدلي الصفحات حقها بعدين
                        // ),
                        const SizedBox(height: 12),
                        MyListTile(
                          title: 'استطلاع الزوار',
                          icon: Icons.person_search_sharp,
                          screenName: PageVisit(), // بدلي الصفحات حقها بعدين
                        ),
                      ],
                      EneftyIcons.note_2_outline,
                    ),
                    const SizedBox(height: 20),
                    myExpandedWidget(
                      context,
                      'التواصل',
                      [
                        const MyListTile(
                          title: 'تواصل معنا',
                          icon: Icons.contactless_outlined,
                          screenName: ContactForm(), // بدلي الصفحات حقها بعدين
                        ),
                        const SizedBox(height: 12),
                        const MyListTile(
                          title: 'التوظيف',
                          icon: Icons.people_alt,
                          screenName: Emploeeykey(), // بدلي الصفحات حقها بعدين
                        ),
                        const SizedBox(height: 12),
                        const MyListTile(
                          title: 'البلاغات والشكاوي',
                          icon: Icons.event_note_outlined,
                          screenName: Problem(), // بدلي الصفحات حقها بعدين
                        ),
                      ],
                      EneftyIcons.message_circle_outline,
                    ),
                    const SizedBox(height: 20),
                    const MyListTile(
                      title: 'المتجر',
                      icon: EneftyIcons.shop_outline,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

navigateToKey(BuildContext context, List<GlobalKey>? keys, int index) {
  if (keys == null) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const HomePage(
          title: 'نادي الصقر',
          imagePath: '',
        ),
      ),
      (route) => false,
    );
  } else {
    Navigator.of(context).pop(); // لإغلاق القائمة عند تحديد العنصر
    Scrollable.ensureVisible(
      keys[index].currentContext!,
      alignment: 0.5,
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile(
      {super.key, required this.title, required this.icon, this.screenName});
  final String title;
  final Widget? screenName;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String url = "https://store.alsaqerfc.sa";
        if (screenName != null) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => screenName!,
            ),
            (route) => false,
          );
        } else {
          try {
            await launchUrl(
              Uri.parse(url),
              mode: LaunchMode.externalApplication,
            );
          } catch (e) {
            log(e.toString());
          }
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            icon,
            color: Colors.black54,
            size: 20,
          ),
        ].reversed.toList(),
      ),
    );
  }
}

Widget myExpandedWidget(
  BuildContext context,
  String title,
  List<Widget> children,
  IconData icon,
) {
  return ExpandablePanel(
    theme: const ExpandableThemeData(
      iconPlacement: ExpandablePanelIconPlacement.right,
    ),
    collapsed: const Row(),
    header: SizedBox(
      height: 40,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4),
            Icon(
              icon,
              color: Colors.black54,
              size: 20,
            ),
          ].reversed.toList(),
        ),
      ),
    ),
    expanded: Padding(
      padding: const EdgeInsets.only(bottom: 4, left: 8, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    ),
  );
}
