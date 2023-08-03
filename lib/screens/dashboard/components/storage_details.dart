import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'storage_info_card.dart';

class StarageDetails extends StatelessWidget {
  const StarageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Statics",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          StorageInfoCard(
            amountOfFiles: 'Customer already buy',
            icon: Icon(Icons.verified),
            title: 'Customer buy',
            numOfFiles: 90,
          ),
          StorageInfoCard(
            amountOfFiles: 'Customer contact',
            icon: Icon(Icons.contact_mail),
            title: 'Customer interst',
            numOfFiles: 90,
          ),
          StorageInfoCard(
            amountOfFiles: 'Customer contact',
            icon: Icon(Icons.contact_mail),
            title: 'Customer interst',
            numOfFiles: 90,
          ),
          StorageInfoCard(
            amountOfFiles: 'try send other one',
            icon: Icon(Icons.access_alarm),
            title: 'Customer didt see massege ',
            numOfFiles: 90,
          ),
        ],
      ),
    );
  }
}
