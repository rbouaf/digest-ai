import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              child: Row(children: [
                Expanded(
                  child: Container(),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Container(),
                  style: ButtonStyle(

                  ),
                )
              ]),
            ),

          ],
        ),
      ),
    );
  }
}
