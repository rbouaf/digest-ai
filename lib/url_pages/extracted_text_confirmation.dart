// import 'package:flutter/material.dart';
//
// class URLConfirmationPage extends StatefulWidget {
//   final String extractedText;
//
//   URLConfirmationPage({Key key, @required this.extractedText}) : super(key: key);
//
//   @override
//   _URLConfirmationPageState createState() => _URLConfirmationPageState();
// }
//
// class _URLConfirmationPageState extends State<URLConfirmationPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Center(
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.grey[800],
//             borderRadius: BorderRadius.circular(20),
//           ),
//           width: 300,
//           height: 400,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(
//                 widget.extractedText,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }