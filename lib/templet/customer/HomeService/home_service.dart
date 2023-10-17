import 'package:contruction0/templet/customer/HomeService/painter.dart';
import 'package:contruction0/templet/customer/HomeService/plumber.dart';
import 'package:contruction0/templet/customer/customer_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../a_widgets/service_category.dart';
import '../../../../a_widgets/text.dart';
import 'ac.dart';
import 'carpenter.dart';
import 'electrician.dart';
import 'geyser.dart';
import 'handymen.dart';
import 'home_appliance.dart';

class HomeService extends StatefulWidget {
  const HomeService({super.key});

  @override
  State<HomeService> createState() => _HomeServiceState();
}

class _HomeServiceState extends State<HomeService> {
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
        title: const TextStyleWidget(text: "Home Service", fontSize: 16),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call,
                color: Colors.blue,
                size: 22,
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
            const TextStyleWidget(text: "Our  services", fontSize: 16),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            //first Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const AcService());
                  },
                  child: const ServicesCategory(
                    text: 'Air Conditinoer',
                    image: "assets/HomeService/ac1.png",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const CarpenterService());
                  },
                  child: const ServicesCategory(
                    text: 'Carpenter',
                    image: "assets/HomeService/carpenter1.jpg",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const ElectricianService());
                  },
                  child: const ServicesCategory(
                    text: 'Electrition',
                    image: "assets/HomeService/electriction1.jpg",
                  ),
                ),
              ],
            ),
            // second Row
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const GeyserService());
                  },
                  child: const ServicesCategory(
                    text: 'Geyser',
                    image: "assets/HomeService/geyser1.jpg",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const HandymenService());
                  },
                  child: const ServicesCategory(
                    text: 'Handyman',
                    image: "assets/HomeService/handymen.jpg",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const HomeAppliance());
                  },
                  child: const ServicesCategory(
                    text: 'Appliances',
                    image: "assets/HomeService/homeappliance1.jpg",
                  ),
                ),
              ],
            ),
            //Third Row
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const PaintService());
                  },
                  child: const ServicesCategory(
                    text: 'Painter',
                    image: "assets/HomeService/painter1.jpg",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const PlumberService());
                  },
                  child: const ServicesCategory(
                    text: 'Plumber',
                    image: "assets/HomeService/plumber1.jpg",
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
