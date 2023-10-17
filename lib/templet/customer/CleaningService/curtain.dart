import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../a_widgets/service_card.dart';
import '../../../../a_widgets/text.dart';
import 'cleaing_service.dart';

class CurtainService extends StatefulWidget {
  const CurtainService({super.key});

  @override
  State<CurtainService> createState() => _CurtainServiceState();
}

class _CurtainServiceState extends State<CurtainService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          //PreferredSize(
          //   preferredSize: const Size.fromHeight(70),
          //  child:
          AppBar(
        title: const TextStyleWidget(
            text: "Curtain Cleaning Service", fontSize: 16),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(250, 250, 251, 251),
        leading: IconButton(
          onPressed: () {
            Get.to(const CleaningService());
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        // flexibleSpace: Column(
        //   children: [
        //     SizedBox(
        //       height: MediaQuery.of(context).size.height * 0.11,
        //     ),
        //     // Adjust the height as needed

        //     // search bar
        //     Container(
        //       width: MediaQuery.of(context).size.width,
        //       height: MediaQuery.of(context).size.height * 0.04,
        //       margin: const EdgeInsets.only(right: 20, left: 20),
        //       decoration: BoxDecoration(
        //         border: Border.all(color: Colors.black, width: 1),
        //         color: Colors.white,
        //         borderRadius: BorderRadius.circular(20),
        //       ),
        //       // Set the background color of the search bar
        //       padding: const EdgeInsets.symmetric(horizontal: 5),
        //       child: TextFormField(
        //         decoration: const InputDecoration(
        //           hintText: "Search",
        //           hintStyle: TextStyle(
        //               color: Colors.black,
        //               fontSize: 15,
        //               fontWeight: FontWeight.bold),
        //           icon: Icon(
        //             Icons.search,
        //             color: Colors.black,
        //             size: 20,
        //           ),
        //           border: InputBorder.none,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
      //  ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            const Padding(
                padding: EdgeInsets.only(left: 15),
                child:
                    TextStyleWidget(text: "choose From below", fontSize: 14)),
            //list 1
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/curtain/curtain1.jpg",
              title: "Curtain Cleaning",
              des: "Per Curtain",
              price: 350,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/curtain/blind.jpg",
              title: "Blind Cleaning",
              des: "Per Blind",
              price: 150,
            ),
            //list 1
          ],
        ),
      ),
    );
  }
}
