import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../a_widgets/service_card.dart';
import '../../../../a_widgets/text.dart';
import 'home_service.dart';

class HandymenService extends StatefulWidget {
  const HandymenService({super.key});

  @override
  State<HandymenService> createState() => _HandymenServiceState();
}

class _HandymenServiceState extends State<HandymenService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          // PreferredSize(
          //     preferredSize: const Size.fromHeight(110),
          //     child:
          AppBar(
        title: const TextStyleWidget(text: "Handymen Service", fontSize: 16),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(250, 250, 251, 251),
        leading: IconButton(
          onPressed: () {
            Get.to(const HomeService());
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
        //           hintText: "Search...",
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
              image: "assets/handymen/clockhang.jpg",
              title: "Wall clock Installation",
              des: "Per Clock",
              price: 250,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/handymen/curtain.jpg",
              title: "Curtain Installation",
              des: "Per Meter Charges without Material",
              price: 750,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/handymen/lcdhang.jpg",
              title: "LCD OR LED Installation",
              des: "LCS with Stand Installation",
              price: 850,
            ),
            //list 1
          ],
        ),
      ),
    );
  }
}
