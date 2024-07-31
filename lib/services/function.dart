import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

void openSocialMedia(String url) async {
  try {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  } catch (e) {
    log(e.toString());
  }
}
