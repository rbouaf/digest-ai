import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'dart:io';

class OCRDoer extends StatefulWidget {
  final File image;
  OCRDoer({required Key key, required this.image}) : super(key: key);
  @override
  _OCRDoerState createState() => _OCRDoerState();
}

class _OCRDoerState extends State<OCRDoer> {
  String _extractedText = '';
  static late FlutterTesseractOcr _tesseractOcr;

  @override
  void initState() {
    super.initState();
    _initTesseract();
    _extractText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OCRDoer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _extractedText.isNotEmpty ? _openPage : null,
              child: Text('Open Page'),
            ),
          ],
        ),
      ),
    );
  }

  void _initTesseract() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = directory.path + '/tesseract';
    _tesseractOcr = (await FlutterTesseractOcr.extractText(path)) as FlutterTesseractOcr;
  }

  void _extractText() async {
    var text = await FlutterTesseractOcr.extractText(widget.image.path);
    _extractedText = text;
    setState(() {});
  }

  void _openPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyPage(extractedText: _extractedText, key: UniqueKey()),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final String extractedText;

  MyPage({required Key key, required this.extractedText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(20),
          ),
          width: 300,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  extractedText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center
              ),
            ],
          ),
        ),
      ),
    );
  }
}
