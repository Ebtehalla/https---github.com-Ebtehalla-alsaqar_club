import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:mime/mime.dart';

class FirebaseStorageHelper {
  static Future<String?> uploadFileToFirebaseStorage({
    required File file,
    required String uid,
    required String collection,
  }) async {
    try {
      Reference storageRef = FirebaseStorage.instance
          .ref()
          .child(collection)
          .child(uid)
          .child((file.path ?? uid));
      // Upload the file
      TaskSnapshot taskSnapshot = await storageRef.putFile(file);
      // Get the download URL
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      log('Error uploading file: $e');
      return null;
    }
  }
}

String? getFileMimeType(String filePath) {
  String? mimeType = lookupMimeType(filePath);

  if (mimeType != null) {
    log('MIME Type: $mimeType');
    return mimeType;
  } else {
    log('MIME Type not found');
    return null;
  }
}
