import 'package:contruction0/templet/customer/CleaningService/sofa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../a_widgets/service_category.dart';
import '../../../../a_widgets/text.dart';
import '../../customer/customer_navigation.dart';
import 'carpet.dart';
import 'chair.dart';
import 'curtain.dart';
import 'mattress.dart';

class CleaningService extends StatefulWidget {
  const CleaningService({super.key});

  @override
  State<CleaningService> createState() => _CleaningServiceState();
}

class _CleaningServiceState extends State<CleaningService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.to(CustumerNavigation());
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black),
        title: const TextStyleWidget(text: "Cleaning Service", fontSize: 22),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call,
                color: Colors.blue,
                size: 25,
              ),
              color: Colors.black),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const TextStyleWidget(text: "All Services Available", fontSize: 20),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            //first Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const SofaService());
                  },
                  child: const ServicesCategory(
                    text: 'Sofa Cleaning',
                    image: "assets/sofa/sofa.jpg",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const MattressService());
                  },
                  child: const ServicesCategory(
                    text: 'Mattress Cleaning',
                    image: "assets/mattress/mattress3.jpg",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const CurtainService());
                  },
                  child: const ServicesCategory(
                    text: 'Curtain Cleaning',
                    image: "assets/curtain/curtain1.jpg",
                  ),
                ),
              ],
            ),

            //secomd Row
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const ChairService());
                  },
                  child: const ServicesCategory(
                    text: 'Chair Cleaning',
                    image: "assets/chair/chair.jpg",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const CarpetService());
                  },
                  child: const ServicesCategory(
                    text: 'Carpet Cleaning',
                    image: "assets/carpet/carpet3.jpg",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class ServicesCategory extends StatelessWidget {
//   final String text;
//   final String image;
//   const ServicesCategory({
//     required this.text,
//     required this.image,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(1.0),
//       child: Container(
//         height: MediaQuery.of(context).size.height * 0.16,
//         width: MediaQuery.of(context).size.width * 0.27,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: const Color.fromARGB(255, 255, 255, 255),
//           boxShadow: const [
//             BoxShadow(
//               color: Color.fromARGB(255, 251, 236, 236),
//               offset: Offset(2, 2),
//             )
//           ],
//           border: Border.all(
//             color: const Color.fromARGB(179, 251, 248, 248),
//           ),
//         ),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.asset(
//                   image,
//                   height: MediaQuery.of(context).size.height * 0.10,
//                   width: MediaQuery.of(context).size.width * 0.2,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Text(
//               text,
//               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
