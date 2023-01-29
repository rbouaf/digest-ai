import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:parsnip/pdf_pages/chatgpt_parser.dart';
import 'dart:io';


class ExtractedTextConfirmation extends StatelessWidget {
  const ExtractedTextConfirmation({Key? key, required this.extractedText})
      : super(key: key);

  final String extractedText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff2f2f2f),
                ),
                child: Text(extractedText, style: const TextStyle(color: Colors.white),)
            ),
          ),
          Row(
            children: [
              BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },

              ),
              TextButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatGPTWidget(prompt: extractedText)),
                    );
                  } ,
                  child: const Text("CONFIRM"))
            ],
          ),
        ]),
      ),
    );
  }
}
