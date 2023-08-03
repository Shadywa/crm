import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditAccountForm extends StatefulWidget {
  const EditAccountForm({super.key});

  @override
  _EditAccountFormState createState() => _EditAccountFormState();
}

class _EditAccountFormState extends State<EditAccountForm> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emilController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController jobs = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userSurName = TextEditingController();
  bool switchValue = true;

  @override
  void initState() {
    super.initState();
  }

  final List<String?> errors = [];
  bool? isPassword = true;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                              backgroundImage: NetworkImage('')),
                          const SizedBox(width: 70),
                          GestureDetector(
                            onTap: () {},
                            child: containerText(
                                text: 'Upload Profile Photo',
                                verticalPadding: 12),
                          ),
                          const SizedBox(width: 50),
                          GestureDetector(
                            onTap: () {},
                            child: containerText(
                                text: 'Delete', verticalPadding: 5),
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          defaultColumn(
                              'User Name', userName, TextInputType.name),
                          const SizedBox(width: 80),
                          defaultColumn(
                              'User Sur Name', userSurName, TextInputType.name),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          defaultColumn(
                              'Phone Number', phoneNumber, TextInputType.phone),
                          const SizedBox(width: 80),
                          defaultColumn('Email', emilController,
                              TextInputType.emailAddress),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          defaultColumn('Jobs', jobs, TextInputType.text),
                          const SizedBox(width: 80),
                          defaultColumn(
                              'Location', location, TextInputType.text),
                        ],
                      ),
                      const SizedBox(height: 25),
                      passwordColumn('Password'),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Delete Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Text(
                            'By deleting yor account you will lose your data',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Switch(
                            value: switchValue,
                            inactiveThumbColor: Colors.grey,
                            activeTrackColor: Colors.blue,
                            activeColor: Colors.white,
                            onChanged: (bool state) {
                              switchValue = !switchValue;
                              setState(() {});
                              print('Current State of SWITCH IS: $state');
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 700,
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: containerText(
                                  text: 'Save changes',
                                  verticalPadding: 15,
                                  color: Colors.blue,
                                  textColor: Colors.white))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget containerText(
      {required String text,
      required double verticalPadding,
      Color? color,
      Color? textColor}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 30),
      decoration: BoxDecoration(
          color: color ?? Colors.grey.shade800,
          borderRadius: BorderRadius.circular(17)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor ?? Colors.blue.shade700),
        ),
      ),
    );
  }

  Widget defaultColumn(String text, TextEditingController controller,
      TextInputType textInputType) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 10,
          ),
          buildFormField(controller: controller, textInputType: textInputType),
        ],
      ),
    );
  }

  Widget passwordColumn(String text) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 10,
          ),
          buildPasswordFormField()
        ],
      ),
    );
  }

  Widget buildPasswordFormField() {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(13)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: passwordController,
          autofillHints: const [AutofillHints.password],
          obscureText: isPassword!,
          //onSaved: (newValue) => password = newValue,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: 'kPassNullError');
            } else if (value.length >= 8) {
              removeError(error: 'kShortPassError');
            }
            //password = value;
          },
          validator: (value) {
            if (value!.isNotEmpty && value.length < 8) {
              addError(error: 'kShortPassError');
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: GestureDetector(
                child: !isPassword!
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.remove_red_eye_outlined),
                onTap: () {
                  isPassword = !isPassword!;
                  setState(() {});
                },
              )),
        ),
      ),
    );
  }

  Widget buildFormField(
      {required TextEditingController controller,
      required TextInputType textInputType}) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(13)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          keyboardType: textInputType,
          onChanged: (value) {},
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: "من فضلك ادخل الاسم");
              return "";
            }
            return null;
          },
          decoration: const InputDecoration(border: InputBorder.none),
        ),
      ),
    );
  }
}
