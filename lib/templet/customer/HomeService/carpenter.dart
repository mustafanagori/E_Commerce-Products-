import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../a_widgets/service_card.dart';
import '../../../../a_widgets/text.dart';
import 'home_service.dart';

class CarpenterService extends StatefulWidget {
  const CarpenterService({super.key});

  @override
  State<CarpenterService> createState() => _CarpenterServiceState();
}

class _CarpenterServiceState extends State<CarpenterService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: AppBar(
          title: const TextStyleWidget(fontSize: 20, text: "Carpenter"),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(250, 250, 251, 251),
          leading: IconButton(
            onPressed: () {
              Get.to(const HomeService());
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          flexibleSpace: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.11,
              ),
              // Adjust the height as needed

              // search bar
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.04,
                margin: const EdgeInsets.only(right: 20, left: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                // Set the background color of the search bar
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 20,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            const Padding(
                padding: EdgeInsets.only(left: 15),
                child:
                    TextStyleWidget(text: "Choose from below", fontSize: 20)),
            //list 1
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/carpenter/carpenterwork.jpg",
              title: "Carpenter work",
              des: "Visit Charges",
              price: 500,
            ),
            //list 1
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/carpenter/catcherReplacement.jpg",
              title: "Catcher Replacement",
              des: "Per Catcher replacement ",
              price: 250,
            ),
            //list 1
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/carpenter/doorLockInsatllation.jpg",
              title: "Door lock Installation",
              des: "per Door lock",
              price: 350,
            ),
            //list 1
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/carpenter/doorReparing.jpg",
              title: "Door Repairing",
              des: "Per Door Repairing",
              price: 3500,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/carpenter/draweRepairing.jpg",
              title: "Drawer Repairing",
              des: "Per Drawer Repairing without material",
              price: 650,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/carpenter/drawerLock.jpg",
              title: "Drawer Lock installtion",
              des: "Per Drawer Lock installtion",
              price: 450,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/carpenter/FurnitureRepairing.jpg",
              title: "Furniture Repairing",
              des: "Service Charges",
              price: 450,
            ),
          ],
        ),
      ),
    );
  }
}
