import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ChatGPTWidget extends StatelessWidget {
  final String prompt;

  ChatGPTWidget({ required this.prompt});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getChatGPTResponse(prompt),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<String> paragraphs = snapshot.data;
          return ListView.builder(
            itemCount: paragraphs.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  paragraphs[index],
                  style: TextStyle(fontSize: 18),
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<List<String>> _getChatGPTResponse(String prompt) async {
    var dio = Dio();
    var response = await dio.post(
        "https://api.openai.com/v1/engines/davinci-codex/completions",
        data: {
          "prompt": prompt,
          "max_tokens": 100,
        },
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer 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",
          },
        ));

    var paragraphs = response.data['choices'][0]['text'].split('\n');
    return paragraphs;
  }
}