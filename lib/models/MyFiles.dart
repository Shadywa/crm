import 'package:flutter/material.dart';

import '../constants.dart';

class CloudStorageInfo {
  final String? svgSrc, total_cus, description, state_of_cus;
  final int? percentage, pagecount;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.state_of_cus,
    this.total_cus,
    this.description,
    this.percentage,
    this.color,
    this.pagecount,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
      state_of_cus: "Customer buy",
      description: 'Ask for opinion',
      svgSrc: "assets/icons/Documents.svg",
      total_cus: "30",
      color: primaryColor,
      percentage: 35,
      pagecount: 1),
  CloudStorageInfo(
      state_of_cus: "Customer interest",
      description: 'customer contact',
      svgSrc: "assets/icons/google_drive.svg",
      total_cus: "40",
      color: Color(0xFFFFA113),
      percentage: 35,
      pagecount: 2),
  CloudStorageInfo(
    state_of_cus: "Customre ignore",
    description: '',
    svgSrc: "assets/icons/one_drive.svg",
    total_cus: "90",
    color: Color(0xFFA4CDFF),
    percentage: 10,
    pagecount: 3,
  ),
  CloudStorageInfo(
    state_of_cus: "Customer dont see massage",
    description: 'try send other one',
    svgSrc: "assets/icons/drop_box.svg",
    total_cus: "100",
    color: Color(0xFF007EE5),
    percentage: 78,
    pagecount: 4,
  ),
];
