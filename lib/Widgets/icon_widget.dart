import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IconsWidget extends StatelessWidget{
  final IconData icons;
  final Color color;
  final double size;

  const IconsWidget({super.key, required this.icons, required this.color, required this.size});
  @override
  Widget build(BuildContext context) {
    return Get.width>365?Icon(
      icons,
      color: color,
      size: size.sp,
    ):Icon(
      icons,
      color: color,
      size: size,
    );
  }

}