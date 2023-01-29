import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:parsnip/home_page.dart';

import 'database_test/database_test.dart';

final titleController = TextEditingController();
final summaryController = TextEditingController();

class SummaryPage extends StatelessWidget {
  late final int index;

  SummaryPage({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    titleController.text = summaryData.list[index].title;
    summaryController.text = summaryData.list[index].content;

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF191919),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Text(
                'Summary',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: TextField(

                controller: titleController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  hintText: 'Summary Title',
                  prefixIcon: const Icon(
                    Icons.title,
                    color: Colors.deepOrangeAccent,
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: h * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: TextField(
                  maxLines: null,
                  textAlign: TextAlign.start,
                  controller: summaryController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    hintText: 'Your Summary',
                    prefixIcon: const Icon(
                      Icons.summarize_outlined,
                      color: Colors.deepOrangeAccent,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    alignLabelWithHint: true,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                summaryData.list[index].title = titleController.text;
                summaryData.list[index].content = summaryController.text;

                Get.to(() => HomePage());
              },
              child: Container(
                width: w * 0.5,
                height: h * 0.08,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  image: DecorationImage(
                    image: AssetImage(
                      'images/loginbtn.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

