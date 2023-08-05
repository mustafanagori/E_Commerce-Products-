// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:serviceprovider/screens/loginScreen/otp.dart';
// import 'package:serviceprovider/a_widgets/custom_button.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController phoneController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     phoneController.selection = TextSelection.fromPosition(
//       TextPosition(
//         offset: phoneController.text.length,
//       ),
//     );
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   const CircleAvatar(
//                     radius: 100,
//                     backgroundImage: AssetImage("assets/register2.jpg"),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.04,
//                   ),
//                   const Text(
//                     "Register Now",
//                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.04,
//                   ),
//                   const Text(
//                     "Add your phone number so that we will send you varification code",
//                     style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black38),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.03,
//                   ),
//                   TextFormField(
//                     keyboardType: TextInputType.number,
//                     cursorColor: Colors.red,
//                     onChanged: (value) {
//                       setState(() {
//                         phoneController.text = value;
//                       });
//                     },
//                     controller: phoneController,
//                     style: const TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.bold),
//                     obscureText: false,
//                     maxLength: 10,
//                     decoration: InputDecoration(
//                       hintText: "Enter phone number",
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(color: Colors.black12)),
//                       focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: const BorderSide(color: Colors.black12)),
//                       prefixIcon: Container(
//                         padding: const EdgeInsets.all(12.0),
//                         child: InkWell(
//                           onTap: () {},
//                           child: const Text(
//                             "+92",
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                       suffixIcon: phoneController.text.length > 9
//                           ? Container(
//                               height: 20,
//                               width: 20,
//                               margin: const EdgeInsets.all(10.0),
//                               decoration: const BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.green,
//                               ),
//                               child: const Icon(
//                                 Icons.done,
//                                 color: Colors.white,
//                                 size: 20,
//                               ),
//                             )
//                           : null,
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.13,
//                   ),
//                   SizedBox(
//                     width: double.infinity,
//                     height: MediaQuery.of(context).size.height * 0.06,
//                     child: CustomButton(
//                         onPressed: () {
//                           Get.to(const OtpScreen());
//                         },
//                         text: "Login"),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
