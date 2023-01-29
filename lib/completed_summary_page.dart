/// This is the actual hard part
///
/// this needs chatgpt functionality
///
/// this needs to be saved on firebase also
///
/// make sure that when you click on the homepage "previous summaries"
///
/// it brings up the correct
///
///
///
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SummaryView extends StatefulWidget {
  const SummaryView({Key? key}) : super(key: key);


  @override
  State<SummaryView> createState() => _SummaryViewState();
}

class _SummaryViewState extends State<SummaryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
          Container(
            decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0xff2f2f2f),
            ),
            child: SingleChildScrollView(
              child: Row(
                children: [
                  const Text("22 Jan 2022"),
                  const Spacer(),
                  const Text("Summary"),
                  const Text("from www.sss.com"),
                  const Spacer(),
                ],
              ),
            ),
          ),

      ]
        ));
  }
}