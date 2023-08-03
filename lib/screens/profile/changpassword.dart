import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool isPasswordOld = true;
  bool isPasswordNew = true;
  bool isPasswordRe = true;

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        backgroundImage: NetworkImage('url')),
                    SizedBox(width: 40),
                    Text(
                      'Shady Wageeh',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                const SizedBox(height: 70),
                Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(13)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              controller: oldPasswordController,
                              obscureText: isPasswordOld,
                              decoration: const InputDecoration(
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: GestureDetector(
                            child: !isPasswordOld
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.white,
                                  ),
                            onTap: () {
                              isPasswordOld = !isPasswordOld;
                              setState(() {});
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        passwordColumn(
                            'New password', controller1, isPasswordNew),
                        const SizedBox(width: 20),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: GestureDetector(
                            child: !isPasswordNew
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.white,
                                  ),
                            onTap: () {
                              isPasswordNew = !isPasswordNew;
                              setState(() {});
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        passwordColumn(
                            'Re-entre New Password', controller2, isPasswordRe),
                        const SizedBox(width: 20),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: GestureDetector(
                            child: !isPasswordRe
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Colors.white,
                                  ),
                            onTap: () {
                              isPasswordRe = !isPasswordRe;
                              setState(() {});
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      child: Container(
                        width: 200,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(17)),
                        child: const Center(
                          child: Text(
                            'Change password',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      onTap: () {
                        if (form.currentState!.validate()) {}
                      },
                    ),
                    const SizedBox(height: 5),
                    GestureDetector(
                        onTap: () {},
                        child: const Text('Did you forget the password?',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 10,
                            )))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget passwordColumn(
      String text, TextEditingController controller, bool isPassword) {
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
          buildPasswordFormField(controller, isPassword)
        ],
      ),
    );
  }

  Widget buildPasswordFormField(
      TextEditingController controller, bool isPassword) {
    return Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(13)),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextFormField(
          controller: controller,
          autofillHints: const [AutofillHints.password],
          obscureText: isPassword,
          validator: (text) {
            // if (controller.text != controller2.text) {
            //   return "كلمات المرور غير متطابقة";
            // }
            // if (controller.text.isEmpty ||
            //     controller.text.contains(" ")) {
            //   return "كلمة المرور غير صالحة";
            // }
            // if (controller.text.length < 9) {
            //   return "كلمة المرور غير صالحة";
            // }
            // return null;
          },
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
