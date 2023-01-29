import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _extractedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick PDF'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: _pickPDF,
              child: Text('Pick PDF'),
            ),
            RaisedButton(
              onPressed: _extractedText.isNotEmpty ? _openPage : null,
              child: Text('Open Page'),
            ),
          ],
        ),
      ),
    );
  }

  void _pickPDF() async {
    File file = await FilePicker.getFile();
    final pdf = pw.Document.openFile(file.path);
    _extractedText = '';
    for (var page in pdf.pages) {
      _extractedText += page.text;
    }
    setState(() {});
  }

  void _openPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyPage(extractedText: _extractedText),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final String extractedText;

  MyPage({Key key, @required this.extractedText}) : super(key: key);

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
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
