
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Widgets/button_widgets.dart';
import '../../../Widgets/formbuildtextfield.dart';
import '../../../Widgets/text_widget.dart';
import 'auth-controller.dart';
class DisplayMeterDetails extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            SizedBox(
              height: 30.h,
            ),

            SizedBox(
              height: 80.h,
            ),
            const Align(
              alignment: Alignment.center,
              child: text_widget(
                color: 0xff003D4C,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                font: "Laila",
                fontSize: 16,
                text: 'Meter Details',
              ),
            ),


          ],
        ),
      ),
    );
  }
}
