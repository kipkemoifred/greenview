
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Widgets/button_widgets.dart';
import '../../../Widgets/formbuildtextfield.dart';
import '../../../Widgets/text_widget.dart';
import 'auth-controller.dart';
import 'capture_meter_data.dart';
class FirstPage extends GetView<AuthController> {
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
                text: 'Kindly Enter Registration Numbers to process',
              ),
            ),
            SizedBox(
              height: 80.h,
            ),
             Obx(() =>  Align(
               alignment: Alignment.center,
               child: text_widget(
                 color: 0xff003D4C,
                 fontWeight: FontWeight.w500,
                 textAlign: TextAlign.center,
                 font: "Laila",
                 fontSize: 16,
                 text: '${controller.regNo}',
               ),
             ),),

            FormBuilder(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: const Color(0xff000000), width: 0.5),
                    ),
                    child: formbuildtextfield(
                        height: 50.sp,
                        color: 0xff707070,
                        hintText: "Enter Registration Number",
                        attribute: "regNo",
                        dividerColor: 0xff1F1C34,
                        errorText: "Enter Registration Number",
                        font: "Poppins",
                        keybordType: TextInputType.number,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.0,
                        formType: "text",
                        dropDownList: [],
                        submitAction: (value) {
                          print(value);

                        }),
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.sp,
            ),
            InkWell(
              child: const button_widgets(
                  color: 0xff71AE00,
                  height: 60,
                  width: 150,
                  radius: 10,
                  borderColor: 0xff71AE00,
                  widget: Center(
                    child: text_widget(
                      color: 0xffFFFFFF,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                      font: "Lato",
                      fontSize: 17,
                      text: "Enter Registration Number",
                    ),
                  )
              ),
              onTap: () async {
                if (formKey.currentState!.saveAndValidate()) {
                  var regNo = formKey.currentState!.value['regNo'].toString();
                  print('regNo $regNo');

                  controller.regNo.add(regNo);
                  print('regNo array ${controller.regNo}');
                }
              },
            ),
            // const Center(child: CircularProgressIndicator(strokeWidth: 1.5,color: Color(0xff71AE00),)),
            SizedBox(
              height: 30.sp,
            ),
            InkWell(
              child: const button_widgets(
                  color: 0xff71AE00,
                  height: 60,
                  width: 150,
                  radius: 10,
                  borderColor: 0xff71AE00,
                  widget: Center(
                    child: text_widget(
                      color: 0xffFFFFFF,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                      font: "Lato",
                      fontSize: 17,
                      text: "Process Registration Number",
                    ),
                  )),
              onTap: () async {
                print('processing regNo array ${controller.regNo}');
                //todo if char for float return -1, remove duplicates
                var distinctIds = controller.regNo.toSet().toList();
                controller.regNo.value=distinctIds;
                print('after removed duplicates regNo array ${controller.regNo}');

                // for(var i in controller.regNo){
                //   if(int.parse(i).isNaN){
                //     controller.regNo.value=[-1];
                //   }
                // }

              },
            ),
            SizedBox(
              height: 30.sp,
            ),
            InkWell(
              child: const button_widgets(
                  color: 0xff71AE00,
                  height: 60,
                  width: 150,
                  radius: 10,
                  borderColor: 0xff71AE00,
                  widget: Center(
                    child: text_widget(
                      color: 0xffFFFFFF,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                      font: "Lato",
                      fontSize: 17,
                      text: "Capture Meter Data",
                    ),
                  )),
              onTap: () async {
    Get.to(CaptureMeterData());

              },
            ),

          ],
        ),
      ),
    );
  }
}
