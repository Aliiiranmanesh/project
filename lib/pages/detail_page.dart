import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Detail_page extends StatefulWidget {
  File file;

  Detail_page({Key? key, required this.file}) : super(key: key);

  @override
  State<Detail_page> createState() => _Detail_pageState();
}

class PDFapi {
  static Future<File> _storeFile(String url, List<int> bytes) async {
    final fileName = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  static Future<File> loadAsset(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();
    return _storeFile(path, bytes);
  }
}

class _Detail_pageState extends State<Detail_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PDFView(
        filePath: widget.file.path,
      ),
    );
  }
}
