// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:serviceprovider/core/utlis.dart';
// import 'package:serviceprovider/screens/others/navigation.dart';

// import 'package:serviceprovider/a_widgets/custom_button.dart';

// class UserInfomationScreen extends StatefulWidget {
//   const UserInfomationScreen({super.key});

//   @override
//   State<UserInfomationScreen> createState() => _UserInfomationScreenState();
// }

// class _UserInfomationScreenState extends State<UserInfomationScreen> {
//   File? image;
//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final bioController = TextEditingController();
//   @override
//   void dispose() {
//     super.dispose();
//     nameController.dispose();
//     emailController.dispose();
//     bioController.dispose();
//   }

//   // change image
//   String currentImage = "assets/men.avif";

//   void changeImage() {
//     setState(() {
//       if (currentImage == "assets/men.avif") {
//         currentImage = "assets/profile1.avif";
//       } else {
//         currentImage = "assets/men.avif";
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 60, left: 8, right: 8),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   GestureDetector(
//                     onTap: changeImage,
//                     child: CircleAvatar(
//                       radius: 70,
//                       backgroundImage: AssetImage(currentImage),
//                     ),
//                   ),

//                   // texfield column
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 40, horizontal: 5),
//                     margin: const EdgeInsets.only(top: 30),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         //name field

//                         textFeld(
//                             hintText: "Enter you name",
//                             icon: Icons.account_circle,
//                             maxLine: 1,
//                             inputtype: TextInputType.name,
//                             controller: nameController),
//                         // email
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.02,
//                         ),
//                         textFeld(
//                             hintText: "Enter your Email",
//                             icon: Icons.edit,
//                             maxLine: 1,
//                             inputtype: TextInputType.name,
//                             controller: emailController),
//                         // bio
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.02,
//                         ),
//                         textFeld(
//                             hintText: "Enter your Phone Number",
//                             icon: Icons.phone,
//                             maxLine: 1,
//                             inputtype: TextInputType.phone,
//                             controller: emailController),
//                         // bio
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.02,
//                         ),

//                         textFeld(
//                             hintText: "Enter the address here",
//                             icon: Icons.description_sharp,
//                             maxLine: 2,
//                             inputtype: TextInputType.name,
//                             controller: bioController),
//                       ],
//                     ),
//                   ),

//                   SizedBox(
//                       width: double.infinity,
//                       height: MediaQuery.of(context).size.height * 0.06,
//                       child: CustomButton(
//                           text: "Next",
//                           onPressed: () {
//                             Utils2.toastMessage("Data has been Added");
//                             Get.to(Navigation());
//                           })),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget textFeld({
//     required String hintText,
//     required IconData icon,
//     required int maxLine,
//     required TextInputType inputtype,
//     required TextEditingController controller,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: TextFormField(
//         cursorColor: Colors.blueAccent,
//         controller: controller,
//         keyboardType: inputtype,
//         maxLines: maxLine,
//         decoration: InputDecoration(
//           prefixIcon: Container(
//             margin: const EdgeInsets.all(8.0),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8), color: Colors.white),
//             child: Icon(
//               icon,
//               size: 22,
//               color: Colors.blueAccent,
//             ),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: const BorderSide(color: Colors.blueAccent),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: const BorderSide(color: Colors.blueAccent),
//           ),
//           hintText: hintText,
//           alignLabelWithHint: true,
//           border: InputBorder.none,
//           fillColor: Colors.blueAccent,
//         ),
//       ),
//     );
//   }
// }
