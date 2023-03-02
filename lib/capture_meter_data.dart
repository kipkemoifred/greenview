
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Widgets/button_widgets.dart';
import '../../../Widgets/formbuildtextfield.dart';
import '../../../Widgets/text_widget.dart';
import 'auth-controller.dart';
import 'display_meter_data.dart';
class CaptureMeterData extends GetView<AuthController> {
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

            const Align(
              alignment: Alignment.center,
              child: text_widget(
                color: 0xff003D4C,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                font: "Laila",
                fontSize: 16,
                text: 'Kindly Enter Your Meter Details',
              ),
            ),
            SizedBox(
              height: 30.sp,
            ),
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
                        hintText: "Enter Your Names",
                        attribute: "name",
                        dividerColor: 0xff1F1C34,
                        errorText: "Enter Your Names",
                        font: "Poppins",
                        keybordType: TextInputType.text,
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: const Color(0xff000000), width: 0.5),
                    ),
                    child: formbuildtextfield(
                        height: 50.sp,
                        color: 0xff707070,
                        hintText: "Enter Customer Number",
                        attribute: "customerNo",
                        dividerColor: 0xff1F1C34,
                        errorText: "Enter Customer Number",
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: const Color(0xff000000), width: 0.5),
                    ),
                    child: formbuildtextfield(
                        height: 50.sp,
                        color: 0xff707070,
                        hintText: "Enter Meter Readings",
                        attribute: "meterReadings",
                        dividerColor: 0xff1F1C34,
                        errorText: "Enter Meter Readings",
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
                    height: 30.sp,
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                ],
              ),
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
                      text: "Upload Meter Image",
                    ),
                  )
              ),
              onTap: () async {
                pickMeterImage();
              },
            ),
            SizedBox(
              height: 10.sp,
            ),
            //todo upload meter image
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
                      text: "Store Meter Details",
                    ),
                  )
              ),
              onTap: () async {
                if (formKey.currentState!.saveAndValidate()) {
                  var name = formKey.currentState!.value['name'].toString();
                  var customerNo = formKey.currentState!.value['customerNo'].toString();
                  var meterReadings = formKey.currentState!.value['meterReadings'].toString();

                  print('name $name');
                  print('customerNo $customerNo');
                  print('meterReadings $meterReadings');

                  var box=Hive.box("meterDetails");
                  box.put("name",name);
                  box.put("customerNo",customerNo);
                  box.put("meterReadings",meterReadings);

                  var nameFromBox=box.get("name");
                  print('nameFromBox $nameFromBox');

                  //controller.regNo.add(regNo);
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
                      text: "Display Meter Details",
                    ),
                  )),
              onTap: () async {
           Get.to(DisplayMeterDetails());
              },
            ),

          ],
        ),
      ),
    );
  }
  void pickMeterImage() async{
    File nationalIDFile=File("");
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // Capture a photo
    //  final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    print('image $image');
    // print('photo $photo');//photo good image error

    if(image!=null){
      nationalIDFile=File(image.path);//todo upload this picked or captured image NationalID
    }
    print('nationalIDFile $nationalIDFile');
  }

}
