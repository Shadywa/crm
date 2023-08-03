import 'package:dashboard/constants.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool switchValue1 = true;
  bool switchValue2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SizedBox(
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      backgroundImage: NetworkImage('')),
                  SizedBox(width: 50),
                  Text(
                    'Shady Wageeh',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              const SizedBox(height: 80),
              const Text('Manage how information is displayed in yor account ',
                  style: TextStyle(color: Colors.white, fontSize: 12)),
              const SizedBox(height: 35),
              displayRow(
                  settingItem: 'Language',
                  defaultValue: 'English',
                  action: 'Update',
                  press: () {
                    print('afeeeee');
                  }),
              displayRow(
                  settingItem: 'Date format',
                  action: 'Remove',
                  press: () {
                    print('afeeeee');
                  }),
              displayRow(
                  settingItem: 'Automatic time zone ',
                  widget: Switch(
                    value: switchValue1,
                    inactiveThumbColor: Colors.grey[400],
                    activeTrackColor: Colors.blue,
                    inactiveTrackColor: Colors.grey[400],
                    activeColor: Colors.white,
                    onChanged: (bool state) {
                      switchValue1 = !switchValue1;
                      setState(() {});
                      print('Current State of SWITCH IS: $state');
                    },
                  )),
              displayRow(
                  settingItem: 'Auto update applicant data  ',
                  widget: Switch(
                    value: switchValue2,
                    inactiveThumbColor: Colors.grey[400],
                    activeTrackColor: Colors.blue,
                    inactiveTrackColor: Colors.grey[400],
                    activeColor: Colors.white,
                    onChanged: (bool state) {
                      switchValue2 = !switchValue2;
                      setState(() {});
                      print('Current State of SWITCH IS: $state');
                    },
                  )),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 30),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(17)),
                        child: const Center(
                          child: Text(
                            ' Save changes',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget displayRow(
      {required settingItem,
      String? defaultValue,
      String? action,
      Widget? widget,
      Function? press}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              settingItem,
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              defaultValue ?? '',
              style: const TextStyle(color: Colors.red),
            ),
            action != null
                ? InkWell(
                    onTap: press as void Function()?,
                    child: Text(
                      action,
                      style: const TextStyle(color: Colors.blue),
                    ),
                  )
                : widget!
          ],
        ),
        const Divider(
          color: Colors.grey,
          thickness: 2,
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  // Widget switcher(bool switchValue){
  //   return Container(
  //     width: 50,
  //     height: 40,
  //     child: Switch(
  //
  //       value: switchValue,
  //       inactiveThumbColor: Colors.grey,
  //       activeTrackColor: Colors.blue,
  //       activeColor: Colors.white,
  //       onChanged: (bool state) {
  //         switchValue=!switchValue;
  //         setState(() {});
  //         print('Current State of SWITCH IS: $state');
  //       },
  //     ),
  //   );
  // }
}
