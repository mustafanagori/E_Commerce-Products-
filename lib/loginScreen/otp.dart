// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pinput/pinput.dart';
// import 'package:serviceprovider/screens/loginScreen/register.dart';
// import 'package:serviceprovider/screens/loginScreen/user_info.dart';
// import 'package:serviceprovider/a_widgets/custom_button.dart';

// class OtpScreen extends StatefulWidget {
//   const OtpScreen({super.key});

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   String? otpCode;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: GestureDetector(
//                         onTap: () => Get.to(const RegisterScreen()),
//                         child: const Icon(Icons.arrow_back),
//                       ),
//                     ),
//                     const CircleAvatar(
//                       radius: 100,
//                       backgroundImage: AssetImage("assets/otp.png"),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.04,
//                     ),
//                     const Text(
//                       "Verification",
//                       style:
//                           TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.04,
//                     ),
//                     const Text(
//                       "Enter the OTP send to your phone number",
//                       style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black38),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.03,
//                     ),
//                     Pinput(
//                       length: 6,
//                       showCursor: true,
//                       defaultPinTheme: PinTheme(
//                           width: MediaQuery.of(context).size.width * 0.11,
//                           height: MediaQuery.of(context).size.height * 0.06,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(color: Colors.blue.shade300),
//                           ),
//                           textStyle: const TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold)),
//                       onSubmitted: (value) {
//                         setState(() {
//                           otpCode = value;
//                         });
//                       },
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.03,
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height * 0.06,
//                       child: CustomButton(
//                           text: "Verify",
//                           onPressed: () {
//                             Get.to(const UserInfomationScreen());
//                           }),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.03,
//                     ),
//                     const Text(
//                       "Didn't received any code",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black38,
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.02,
//                     ),
//                     const Text(
//                       "Resend new Code",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ]),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void verifyOtp(BuildContext context, String userOtp) {}
// }
