import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFPage extends StatelessWidget {
  final String pdfURL;

  const PDFPage({super.key, required this.pdfURL});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('عرض ملف PDF'),
      ),
      body: PDFView(
        filePath: pdfURL,
      ),
    );
  }
}
