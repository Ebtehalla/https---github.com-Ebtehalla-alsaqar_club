// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaPage extends StatelessWidget {
  final String imgUrl;
  final String text;
  final String whatsappUrl;
  final String facebookUrl;
  final String instagramUrl;
  final String snapchaUrl;
  final String telegramUrl;
  final String instaUrl;

  const SocialMediaPage(
      {super.key,
      required this.imgUrl,
      required this.text,
      required this.whatsappUrl,
      required this.facebookUrl,
      required this.instagramUrl,
      required this.snapchaUrl,
      required this.telegramUrl,
      required this.instaUrl});

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Media Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              imgUrl,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              text,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _launchURL(whatsappUrl),
              child: const Text('WhatsApp'),
            ),
            ElevatedButton(
              onPressed: () => _launchURL(facebookUrl),
              child: const Text('Facebook'),
            ),
            ElevatedButton(
              onPressed: () => _launchURL(snapchaUrl),
              child: const Text('Snapchat'),
            ),
            ElevatedButton(
              onPressed: () => _launchURL(telegramUrl),
              child: const Text('telegram'),
            ),
            ElevatedButton(
              onPressed: () => _launchURL(instaUrl),
              child: const Text('insta'),
            ),
          ],
        ),
      ),
    );
  }
}
