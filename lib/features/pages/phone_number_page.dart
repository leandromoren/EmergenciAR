// import 'package:flutter/material.dart';
// import 'package:vidar_app/features/pages/widgets/button.dart';
// import 'package:vidar_app/features/pages/widgets/input_box.dart';
// import 'package:vidar_app/utils/constants/styles.dart';

// class PhoneNumberPage extends StatefulWidget {
//   static const routeName = "sdakfalskf";

//   const PhoneNumberPage({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _PhoneNumberPageState createState() => _PhoneNumberPageState();
// }

// String mobileNumber = '1111111111';

// class _PhoneNumberPageState extends State<PhoneNumberPage> {
//   var userEnteredMobileNumber = InputBox(
//     hintText: 'Enter Phone Number',
//     labelText: 'Phone Number (+91)',
//   );

//   bool display = false;

//   getMobileNumber() async {
//    // mobileNumber = await MobileNumber.mobileNumber;
//     setState(() {});
//   }

//   @override
//   void initState() {
//     getMobileNumber();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Phone Number',
//             style: kAppBarText,
//           ),
//         ),
//         body: ListView(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Visibility(
//                   visible: !display,
//                   child: Container(
//                     height: 200.0,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: <Widget>[
//                         Button(
//                           onPressed: () {
//                             setState(() {});
//                           },
//                           text: 'REFRESH',
//                         ),
//                         const Text(
//                           'Phone Number Identified as',
//                           style: kBigText,
//                           textAlign: TextAlign.center,
//                         ),
//                         Text(
//                           mobileNumber.substring(2),
//                           style: kBigText.copyWith(
//                             color: Colors.blueAccent,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 50.0,
//                 ),
//                 Button(
//                   onPressed: () {
//                     setState(() {
//                       display = !display;
//                     });
//                   },
//                   text: !display ? "ENTER MANUALLY" : "AUTO-DETECT",
//                 ),
//                 const SizedBox(
//                   height: 20.0,
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(18.0),
//                   child: Divider(
//                     thickness: 4.0,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 50.0,
//                 ),
//                 Visibility(
//                   visible: display,
//                   child: Container(
//                       child: Column(
//                     children: <Widget>[
//                       const Text(
//                         'Enter Manually',
//                         style: kBigText,
//                       ),
//                       userEnteredMobileNumber,
//                     ],
//                   )),
//                 ),
//                 const SizedBox(
//                   height: 20.0,
//                 ),
//                 /*Button(
//                   onPressed: () {
//                     // ignore: unnecessary_null_comparison
//                     if (userEnteredMobileNumber.input != null &&
//                         userEnteredMobileNumber.input.length != 10) {
//                       showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             actions: <Widget>[
//                               Button(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 text: 'CLOSE',
//                               ),
//                             ],
//                             content: const Text(
//                               'Enter Valid Phone Number',
//                               style: kSubHeadingText,
//                             ),
//                             contentPadding: const EdgeInsets.all(8.0),
//                           );
//                         },
//                       );
//                     } else if (userEnteredMobileNumber.input != null &&
//                         userEnteredMobileNumber.input.length == 10) {
//                       mobileNumber = '+91${userEnteredMobileNumber.input}';
//                       Navigator.pushNamed(
//                         context,
//                         ReportEmergencyPage.routeName,
//                       );
//                     } else if (mobileNumber != null &&
//                         (userEnteredMobileNumber.input == null ||
//                             userEnteredMobileNumber.input == '')) {
//                       Navigator.pushNamed(
//                         context,
//                         ReportEmergencyPage.routeName,
//                       );
//                     } else if (!display) {
//                       Navigator.pushNamed(
//                         context,
//                         ReportEmergencyPage.routeName,
//                       );
//                     }
//                   },
//                   text: 'PROCEED',
//                 ),*/
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }