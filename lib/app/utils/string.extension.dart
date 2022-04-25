// import 'dart:math';

// import 'package:eldesk/common/constants/constants.dart';
// import 'package:get/get_utils/src/extensions/string_extensions.dart';
// import 'package:html/parser.dart';
// import 'package:flutter/material.dart';

// extension StringExtend on String? {
//   String getInitials({int? limit = 2}) {
//     if (this!.isEmpty) {
//       return "";
//     }
//     var nameParts = this!.split(" ").map((elem) {
//       try {
//         return elem[0];
//       } catch (e) {
//         return "";
//       }
//     });

//     if (nameParts.length == 0) {
//       return "";
//     }

//     int numberOfParts = min(limit!, nameParts.length);
//     return nameParts.join().substring(0, numberOfParts);
//   }

//   bool get isAvailable => this != null && this!.isNotEmpty;

//   String get removeHtmlTags =>
//       this == null ? "" : parse(parse(this).body!.text).documentElement!.text;

//   String get getExtension =>
//       this!.substring(this!.lastIndexOf(".")).toLowerCase();

//   String get getFileType =>
//       this!.substring(this!.lastIndexOf(".") + 1).toUpperCase();

//   Color get getColor => Color(int.tryParse(this!.replaceFirst("#", "0xFF"))!);

//   bool get isImageFileType =>
//       IMAGE_FILE_TYPES.contains(this!.toLowerCase().trim());

//   bool get isURLType => this!.isURL || this!.startsWith("http");

//   bool get isSvg => this!.endsWith("svg");
// }
