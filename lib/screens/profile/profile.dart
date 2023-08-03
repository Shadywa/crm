import 'package:dashboard/constants.dart';
import 'package:dashboard/screens/profile/setting.dart';
import 'package:flutter/material.dart';

import 'changpassword.dart';
import 'edit_info.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profile();
}

class _profile extends State<profile> {
  int pageNumber = 1;
  Color textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                      onTap: () {
                        pageNumber = 1;
                        textColor = Colors.redAccent;
                        setState(() {});
                      },
                      child: defaultTextButton(
                          'Personal information', Colors.white, 1)),
                  GestureDetector(
                      onTap: () {
                        pageNumber = 2;
                        textColor = Colors.redAccent;
                        setState(() {});
                      },
                      child: defaultTextButton('Password', Colors.white, 2)),
                  GestureDetector(
                      onTap: () {
                        pageNumber = 3;
                        textColor = Colors.redAccent;
                        setState(() {});
                      },
                      child: defaultTextButton('Account', Colors.white, 3))
                ],
              ),
            ),
            if (pageNumber == 1)
              const SizedBox(width: 1000, child: EditAccountForm()),
            if (pageNumber == 2)
              const SizedBox(width: 400, child: ChangePassword()),
            if (pageNumber == 3) SizedBox(width: 400, child: Account()),
          ],
        ),
      ),
    );
  }

  Widget defaultTextButton(String text, Color color, int number) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          color: pageNumber == number ? Colors.green : Colors.white,
        ),
      ),
    );
  }
}
