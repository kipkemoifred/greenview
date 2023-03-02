import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class formbuildtextfield extends StatefulWidget {
  final String attribute, hintText, font, errorText;
  final int color, dividerColor;
  final double fontSize, height;
  final FontWeight fontWeight;
  final TextInputType keybordType;
  final String formType;
  final List dropDownList;
  final Function submitAction;

  const formbuildtextfield(
      {required this.attribute,
      required this.hintText,
      required this.font,
      required this.errorText,
      required this.color,
      required this.dividerColor,
      required this.fontSize,
      required this.height,
      required this.fontWeight,
      required this.keybordType,
      required this.formType,
      required this.dropDownList,
      required this.submitAction});

  @override
  State<StatefulWidget> createState() {
    return _formbuildtextfieldState();
  }
}

class _formbuildtextfieldState extends State<formbuildtextfield> {
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
   return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Color(0xff707070), width: 0.5),
              //   color: Colors.white10
            ),
            child: Padding(
                padding:
                    EdgeInsets.only(top: 8.0.sp, left: 8.0.sp, bottom: 8.0.sp),
                child: FormBuilderTextField(
                  name: widget.attribute,
                  // autofocus: true,
                  style: TextStyle(
                    fontFamily: widget.font,
                    color: Color(0xff000000),
                    fontSize: widget.hintText == "Series title"
                        ? 16.sp
                        : widget.fontSize.sp,
                    fontWeight: widget.fontWeight,
                  ),
                  onChanged: (v){
                    widget.submitAction();
                  },
                  obscureText:
                      widget.hintText.toLowerCase().contains("password")||widget.hintText.toLowerCase().contains("pin")
                          ? showPassword
                          : false,
                  keyboardType: widget.keybordType,
                  textCapitalization:
                      widget.hintText.toLowerCase().contains("email")
                          ? TextCapitalization.none
                          : TextCapitalization.sentences,
                  textInputAction: TextInputAction.next,
                  showCursor: true,
                  enableSuggestions: true,
                  validator: widget.hintText.toLowerCase().contains("optional")?
                  FormBuilderValidators.compose([

                  ])
                      :
                  FormBuilderValidators.compose([
                    FormBuilderValidators.required(context),
                  ]),

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon:
                        widget.hintText.toLowerCase().contains("password")||widget.hintText.toLowerCase().contains("pin")
                            ? InkWell(
                                child: Icon(
                                  showPassword == false
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Color(widget.color),
                                ),
                                onTap: () {
                                  if (showPassword == true) {
                                    setState(() {
                                      showPassword = false;
                                    });
                                  } else {
                                    setState(() {
                                      showPassword = true;
                                    });
                                  }
                                },
                              )
                            : SizedBox(),
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      fontFamily: widget.font,
                      color: Color(widget.color),
                      fontSize: widget.fontSize,
                      fontWeight: widget.fontWeight,
                    ),
                  ),
                )),
          );
  }
}
