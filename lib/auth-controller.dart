
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Widgets/button_widgets.dart';
import '../Widgets/text_widget.dart';

class AuthController {
  //String _identifier = "".obs as String;

  //dashboard stuff
  RxInt initialIndex = 0.obs;
  RxString otpValueString="".obs;
  RxInt dashInitialIndex = 0.obs;
  var selectedValueTime="".obs;
  var encodePinpadPin="".obs;
  var encodedPinpadPinValue="".obs;
  var encodedLoginValue="".obs;
  RxBool showLoader = false.obs;
  RxList regNo=[].obs;

  List gridMenu = [
    {"name": "Request Loan", "image": "assets/payment.png", "color": 0xffFEF8EA},
    {
      "name": "Loan Status",
      "image": "assets/marketplace.png",
      "color": 0xffEDE4FF
    },
    {
      "name": "Repay Loan",
      "image": "assets/valueaddedservvices.png",
      "color": 0xffE3FFEF
    },
    {
      "name": "Loan Limit",
      "image": "assets/loyalty.png",
      "color": 0xffE3EDFF
    },
  ];

  //dashboard stuff

  Future<void> getImei() async {
    String? imei;
    try {
      //imei = await DeviceImei.getImei();
    } catch (e) {
      print(e);
    }
    print("${imei} imei=================================");
  }
  Future showCustomerRegistrationSuccessPopDialog() async {
    Get.defaultDialog(
        title: "",
        content: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: text_widget(
                  color: 0xff000000,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 15,
                  text:
                      "Dear Customer,your Mobigrow account opening request has been received and is being processed",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
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
                          text: "Ok",
                        ),
                      )),
                  onTap: () async {
                    //Get.back();
                   // Get.to(LoginPage());
                  },
                ),
              ],
            ),
          )
        ]);
  }
  Future showCurrentLoanLimitPopDialog(String loanLimitAmount)async {
    Get.defaultDialog(
        title: "",
        content: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
               Align(
                alignment: Alignment.centerLeft,
                child: text_widget(
                  color: 0xff000000,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 15,
                  text:
                  "Dear Customer,your current loan limit is Ksh ${loanLimitAmount}",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
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
                          text: "Ok",
                        ),
                      )),
                  onTap: () async {
                    //Get.to(DashboardPage());
                    Get.back();
                  },
                ),
              ],
            ),
          )
        ]);
  }
  Future showCurrentLoanStatusPopDialog(String loanStatusAmount)async {
    Get.defaultDialog(
        title: "",
        content: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
               Align(
                alignment: Alignment.centerLeft,
                child: text_widget(
                  color: 0xff000000,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 15,
                  text:
                  "Dear Customer,your current loan balance Ksh ${loanStatusAmount}",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
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
                          text: "Ok",
                        ),
                      )),
                  onTap: () async {
                    Get.back();
                    //Get.to(DashboardPage());
                  },
                ),
              ],
            ),
          )
        ]);
  }
  Future showRequestLoanPopDialog(var amount)async {
    Get.defaultDialog(
        title: "",
        content: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
               Align(
                alignment: Alignment.centerLeft,
                child: text_widget(
                  color: 0xff000000,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 15,
                  text:
                  "Dear Customer,your loan of Ksh ${amount}  is being processed",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
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
                          text: "Ok",
                        ),
                      )),
                  onTap: () async {
                    //Get.back();
                 //   Get.to(DashboardPage());
                  },
                ),
              ],
            ),
          )
        ]);
  }
  Future showRepaymentLoanPopDialog(var amount)async {
    Get.defaultDialog(
        title: "",
        content: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
               Align(
                alignment: Alignment.centerLeft,
                child: text_widget(
                  color: 0xff000000,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 15,
                  text:
                  "Dear Customer,your Payment Of  Ksh ${amount} has been received",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
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
                          text: "Ok",
                        ),
                      )),
                  onTap: () async {
                    //Get.back();
                    //Get.to(DashboardPage());
                  },
                ),
              ],
            ),
          )
        ]);
  }

  Future showWrongCredentialsPopDialog() async {
    Get.defaultDialog(
        title: "",
        content: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.center,
                child: text_widget(
                  color: 0xffFF0000,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 20,
                  text: "Wrong Credentials Or No Internet",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: text_widget(
                  color: 0xff003D4C,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  font: "Lato",
                  fontSize: 17,
                  text: "Please Change The Credentials,Check Your Internet Connection And Try Again",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                InkWell(
                  child: const button_widgets(
                      color: 0xff003D4C,
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
                          text: "Ok",
                        ),
                      )),
                  onTap: () async {
                    Get.back();
                  },
                ),
              ],
            ),
          )
        ]);
  }

  // Future mobileNumber() async {
  //   print('mobileNumber');
  //   String _mobileNumber = '';
  //   List<SimCard> _simCard = <SimCard>[];
  //
  //   MobileNumber.listenPhonePermission((isPermissionGranted) {
  //     if (isPermissionGranted) {
  //       print('isPermissionGranted');
  //       initMobileNumberState();
  //     } else {}
  //   });
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     _mobileNumber = (await MobileNumber.mobileNumber)!;
  //     _simCard = (await MobileNumber.getSimCards)!;
  //     print('==================================================================');
  //     print("${_simCard} _simCard \n ${_mobileNumber.toString()} _mobileNumber");
  //     List<Widget>sim=_simCard
  //         .map((SimCard sim) => Text(
  //         'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}\nCarrier Name: ${sim.carrierName}\nCountry Iso: ${sim.countryIso}\nDisplay Name: ${sim.displayName}\nSim Slot Index: ${sim.slotIndex}\n\n'))
  //         .toList();
  //     print('$sim');
  //     print('==================================================================');
  //   } on PlatformException catch (e) {
  //     debugPrint("Failed to get mobile number because of '${e.message}'");
  //   }
  // }

  // Platform messages are asynchronous, so we initialize in an async method.
  // Future<void> initMobileNumberState() async {
  //   print('initMobileNumberState');
  //   if (!await MobileNumber.hasPhonePermission) {
  //     await MobileNumber.requestPhonePermission;
  //     return;
  //   }
  // }


//
// Future<void> initUniqueIdentifierState() async {
//   print("initUniqueIdentifierState");
//   String? identifier;
//   try {
//     identifier = await UniqueIdentifier.serial;
//   } on PlatformException {
//     identifier = 'Failed to get Unique Identifier';
//   }
//   print("identifier ${identifier}  identifier");
//
//   //if (!mounted) return;
//
// }

  // Future<void> getSimData() async{
  //   SimData simData;
  //   try {
  //     var status = await Permission.phone.status;
  //     if (!status.isGranted) {
  //       bool isGranted = await Permission.phone.request().isGranted;
  //       if (!isGranted) return;
  //     }
  //     simData = await SimDataPlugin.getSimData();
  //     printSimCardsData();
  //     print("${simData}  simData");
  //   }catch (e){
  //     debugPrint(e.toString());
  //   }
  // }

  // void printSimCardsData() async {
  //   SimData simData;
  //   try {
  //     var status = await Permission.phone.status;
  //     if (!status.isGranted) {
  //       bool isGranted = await Permission.phone.request().isGranted;
  //       if (!isGranted) return;
  //     }
  //
  //     simData = await SimDataPlugin.getSimData();
  //     for (var s in simData.cards) {
  //       // ignore: avoid_print
  //       print('Serial number: ${s.serialNumber}========================================');
  //     }
  //   } on PlatformException catch (e) {
  //     debugPrint("error! code: ${e.code} - message: ${e.message}");
  //   }
  // }

Future<void> deviceInfo()async {
  print('deviceInfo');
    String imeiNo="";
    try {
      print('deviceInfo try');
     // String platformVersion = await DeviceInformation.platformVersion;
      print('before imei assignment');
      //imeiNo = await DeviceInformation.deviceIMEINumber;
      print('after imei assignment $imeiNo');
     // String modelName = await DeviceInformation.deviceModel;
     // String manufacturer = await DeviceInformation.deviceManufacturer;
     // String apiLevel =  await DeviceInformation.apiLevel;
     // String deviceName = await DeviceInformation.deviceName;
     // String productName = await DeviceInformation.productName;
     // String cpuType = await DeviceInformation.cpuName;
     // String hardware = await DeviceInformation.hardware;
    } on PlatformException {
      String platformVersion = 'Failed to get platform version.';
    }
    print('${imeiNo} imeiNo========================================');
  }

  // Future<void> getSimSerialNumber()async{
  //   print('in auth controller getSimSerialNumber ');
  //   const platform = MethodChannel('get serial number');
  //    try {
  //      final int result = await platform.invokeMethod('getSimSerialNumber');
  //    } on PlatformException catch (e) {
  //      print('${e.message}');
  //   }
  // }


}
