// import 'package:flutter/material.dart';

// import '../../../../a_widgets/custom_button.dart';
// import '../../../../a_widgets/text.dart';

// class DateTime2 extends StatefulWidget {
//   const DateTime2({super.key});

//   @override
//   State<DateTime2> createState() => _DateTime2State();
// }

// class _DateTime2State extends State<DateTime2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Data Time",
//           style: TextStyle(
//               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//         backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             const TextStyleWidget(text: "Data & Time ", fontSize: 30),
//             CustomButton(
//                 text: "Pick Data",
//                 onPressed: () async {
//                   DateTime? datepicked = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime(2022),
//                       lastDate: DateTime(2023));

//                   if (datepicked != null) {}
//                 }),
//             CustomButton(
//                 text: "Select Time",
//                 onPressed: () async {
//                   TimeOfDay? pickedTime = await showTimePicker(
//                       context: context,
//                       initialTime: TimeOfDay.now(),
//                       initialEntryMode: TimePickerEntryMode.dial);
//                   if (pickedTime != null) {}
//                 }),
//           ],
//         ),
//       ),
//     );
//   }
// }
