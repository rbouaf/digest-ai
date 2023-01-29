import 'dart:io';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:flutter/services.dart';
import 'package:parsnip/pdf_pages/extracted_text_confirmation.dart';
import 'package:parsnip/completed_summary_page.dart';
import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';
import 'package:parsnip/camera_pages/camera_view.dart';
import 'package:parsnip/completed_summary_page.dart';
import 'package:parsnip/database_test/database_test.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String $extractedText = '';
  @override
  Widget build(BuildContext context) =>
      Scaffold(
          key: _scaffoldKey,
          backgroundColor: Color(0xff1f222d),
          drawer: Drawer(
            backgroundColor: Color(0xff1f222d),
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(1.1, 0),
                      radius: 1.5,
                      colors: <Color>[
                        Color(0xffc31432),
                        Color(0xff240b36),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                            'assets/images/ProfilePic.jpg'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 45.0, left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "John Doe",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'SF Pro Rounded',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "john.doe@gmail.com",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontSize: 18,
                                  fontFamily: 'SF Pro Rounded',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                ListTile(
                  tileColor: Color(0xff292c36),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 20.0, bottom: 25),
                  subtitle: Text(
                    "Change your username, profile picture, password, email...",
                    style: TextStyle(color: Colors.white.withOpacity(0.6)),
                  ),
                  leading: Icon(Icons.edit, color: Colors.white),
                  title: const Text('Edit Profile',
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  color: Colors.white.withOpacity(0.0),
                  thickness: 0.0,
                  indent: 0,
                  endIndent: 0,
                ),
                ListTile(
                  tileColor: Color(0xff292c36),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 20.0, bottom: 25),
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: const Text(
                      'Logout', style: TextStyle(color: Colors.red)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: Column(children: [
            Padding(
                padding: EdgeInsets.only(
                    top: 50.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "disgest.ai",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'SF Pro Rounded',
                          fontWeight: FontWeight.bold),
                    ),
                    //create floatingaction button that when pressed opens the drawer of the scaffold
                    FloatingActionButton(
                      backgroundColor: Color(0xff1c1d1f),
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                      child: Icon(Icons.person),
                    ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                child: LayoutBuilder(builder: (context, constraint) {
                  return SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        summaryData.list.length, (index) =>
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),

                            /////////////////////////////////////////////////////////////////////// ////////////////
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SummaryView(
                                                selectedSummary: summaryData
                                                    .list[index])),
                                  );
                                });
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10)),
                                  color: Color(0xff2f2f2f),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        flex: 0,
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft: Radius.circular(
                                                    10)),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'images/signup.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text("Name",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight
                                                          .bold,
                                                      fontFamily: 'SF Pro Rounded')),
                                              Text("Description",
                                                  style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 200),
                                                    fontSize: 12,
                                                  )),
                                              Text("\n"),
                                            ],
                                          ),
                                          ElevatedButton.icon(
                                              onPressed: () {},
                                              icon: Icon(Icons.more_vert),
                                              label: Text(""),
                                              style: ElevatedButton.styleFrom(
                                                  alignment: Alignment
                                                      .centerRight,
                                                  backgroundColor:
                                                  Colors.transparent)),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        //////////////////////////////////////////////////////////////////////////////////

                        /////////////////////////////////////////////////////////////////// /////////////

                      ),
                    ),
                  );
                }
                ),
              ),

            ),
          ]
          ),
          floatingActionButton: SpeedDial(
            buttonSize: Size(80, 80),
            spacing: 10,
            spaceBetweenChildren: 10,
            icon: Icons.add,
            activeIcon: Icons.close,
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xff8a2387),
                Color(0xffe94057),
                Color(0xfff27121),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            gradientBoxShape: BoxShape.circle,
            childrenButtonSize: Size(75, 75),
            backgroundColor: Colors.black,
            overlayColor: Colors.black,
            overlayOpacity: 0.2,
            children: [
              SpeedDialChild(
                  child: Icon(Icons.camera_alt),
                  label: "Take photo",
                  labelBackgroundColor: Colors.black,
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'SF Pro Rounded',
                      fontWeight: FontWeight.bold),
                  onTap: () async {
                    await availableCameras().then((value) =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => CameraView(cameras: value))));
                  }),
              SpeedDialChild(
                labelBackgroundColor: Colors.black,
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'SF Pro Rounded',
                    fontWeight: FontWeight.bold),
                child: Icon(Icons.image),
                label: "Upload Image",
                onTap: () {},
              ),
              SpeedDialChild(
                labelBackgroundColor: Colors.black,
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'SF Pro Rounded',
                    fontWeight: FontWeight.bold),
                child: Icon(Icons.picture_as_pdf),
                label: "Upload PDF",
                onTap: () async {
                  final result = await FilePicker.platform.pickFiles(

                    type: FileType.custom,
                    allowedExtensions: ['pdf'],
                  );
                  if (result == null) return;
                  final file = result.files.first;

                  await _extractTextFromRangeOfPage(file,0,0);
                  // go to ExtractedTextPage and pass $extractedText as argument
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExtractedTextConfirmation(
                        extractedText: $extractedText,
                      ),
                    ),
                  );

                },
              ),
              SpeedDialChild(
                labelBackgroundColor: Colors.black,
                labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'SF Pro Rounded',
                    fontWeight: FontWeight.bold),
                child: Icon(Icons.insert_link),
                label: "Use URL Link",
                onTap: () {},
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat

        // Expanded(
        //   child: LayoutBuilder(
        //     builder: (context, constraint) {
        //       return SingleChildScrollView(
        //         child: Column(
        //           children: List.generate(
        //             summaryData.list.length,
        //             (index) => Padding(),
        //             ),
        //           ),
        //         ),
        //       );
        //     },
        //   ),
        // ),
      );


  Future<void> _extractTextFromRangeOfPage(PlatformFile file, int start,
      int end) async {
    //Loads an existing PDF document
    PdfDocument document =
    PdfDocument(inputBytes: File(file.path as String).readAsBytesSync());

//Extracts the text from pages 1 to 3
    String text = PdfTextExtractor(document).extractText();
    $extractedText= text;

//Dispose the document
    document.dispose();
  }
}
