
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'auth-controller.dart';
import 'firstpage.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
void main() async{
  await GetStorage.init();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
   Hive.init(directory.path);
  await Hive.openBox("meterDetails");
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.


  @override
  Widget build(BuildContext context){
    Get.put(AuthController());
    return ScreenUtilInit(
      designSize: const Size(360,690),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MobGrow',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home:FirstPage(),//TODO add flashscreen in future as values are being fetched 10s
        );
      },
    );
  }
}

