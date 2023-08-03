import 'package:dashboard/constants.dart';
import 'package:dashboard/models/sendmassage.dart';
import 'package:flutter/material.dart';

import '../dashboard/components/clipPath.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({
    Key? key,
    required this.name,
    required this.e_mail,
    required this.phone,
  }) : super(key: key);
  final String name;
  final String e_mail;
  final String phone;
  void view_page_details(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SendMessageScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: secondaryColor, borderRadius: BorderRadius.circular(35)),
        child: Column(children: [
          mainContainer(context),
          Expanded(
              child: ClipPath(
                  clipper: CurveCut(),
                  child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 25,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 5,
                              color: Colors.grey[200],
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Send Massege',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            MaterialButton(
                              onPressed: () {
                                view_page_details(context);
                              },
                              child: Container(
                                height: 50,
                                width: 220,
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    'send',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'chang contact info',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            MaterialButton(
                              onPressed: () {},
                              child: Container(
                                height: 50,
                                width: 220,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFb22727),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Change',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))))
        ]));
  }

  Widget mainContainer(context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(''),
          ),
          const SizedBox(height: 10),
          Text(name,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white)),
          Text(e_mail,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.white)),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
