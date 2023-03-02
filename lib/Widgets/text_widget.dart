import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class text_widget extends StatelessWidget {
  final String text, font;
  final int color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const text_widget(
      {Key? key,
      required this.text,
      required this.font,
      required this.color,
      required this.fontSize,
      required this.fontWeight,
      required this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Get.width>365?Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.getFont("Poppins",
        color: Color(color),
        fontSize: fontSize.sp,
        fontWeight: fontWeight,),
    ):Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.getFont("Poppins",
        color: Color(color),
        fontSize: fontSize.sp,
        fontWeight: fontWeight,),
    );
  }

}
extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1).toLowerCase()}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
}
