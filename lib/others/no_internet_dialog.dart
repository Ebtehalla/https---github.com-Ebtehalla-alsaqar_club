import 'dart:io' show Platform, exit;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class NoInternetDialog extends StatelessWidget {
  final bool canDismiss;

  const NoInternetDialog({super.key, this.canDismiss = false});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return canDismiss ? true : false;
      },
      child: AlertDialog(
        title: const Row(
          children: [
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "No internet connection",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        content: const Text(
          "Please check your internet connection as you can enjoy using app normally,This warning will disappear when you reconnect to the Internet",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12.0,
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else if (Platform.isIOS) {
                exit(0);
              }
            },
            child: const Text("Exit"),
          ),
          MaterialButton(
            onPressed: () {
              // AppSettings.openWIFISettings();
            },
            child: const Text("Settings"),
          ),
        ],
      ),
    );
  }
}
