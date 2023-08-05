import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../a_widgets/service_card.dart';
import '../../../../a_widgets/text.dart';
import 'home_service.dart';

class ElectricianService extends StatefulWidget {
  const ElectricianService({super.key});

  @override
  State<ElectricianService> createState() => _ElectricianServiceState();
}

class _ElectricianServiceState extends State<ElectricianService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: AppBar(
          title: const TextStyleWidget(fontSize: 20, text: "Electrician.."),
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
            //category 1
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/electrician/fancyLight.jpg",
              title: "Fancy Light installation",
              des: "Per Light installation",
              price: 300,
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            const ServiceCardWidget(
              image: "assets/electrician/fanInstalltion.jpg",
              title: "Fan installtion",
              des: "Per fan installation",
              price: 350,
            ),

            //list 1
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            const ServiceCardWidget(
              image: "assets/electrician/fanDimer.jpg",
              title: "fan Dimer Replacement",
              des: "Per fan Dimer",
              price: 650,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            const ServiceCardWidget(
              image: "assets/electrician/exhaust.jpg",
              title: "Exhaust fan Installation",
              des: "Per exhaust",
              price: 450,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            const ServiceCardWidget(
              image: "assets/electrician/kitchenHood.jpg",
              title: "Kitchen Hood Installation",
              des: "Per Hood Installation",
              price: 1300,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            const ServiceCardWidget(
              image: "assets/electrician/LCDinstallation.jpg",
              title: "LCD Installation",
              des: "Per LCD Installation",
              price: 850,
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            const ServiceCardWidget(
              image: "assets/electrician/smdlight.jpg",
              title: "SMD Light Installation",
              des: "Per Light Installation",
              price: 250,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            const ServiceCardWidget(
              image: "assets/electrician/switchboard.jpg",
              title: "Switch Board Installation",
              des: "Per Switch",
              price: 350,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            const ServiceCardWidget(
              image: "assets/electrician/tubeLight.jpg",
              title: "Tube Light Installation",
              des: "Per Tube Light Installation",
              price: 460,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            const ServiceCardWidget(
              image: "assets/electrician/ups.jpg",
              title: "UPS Installation",
              des: "Per UPS Installation ",
              price: 1600,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            const ServiceCardWidget(
              image: "assets/electrician/wiring.jpg",
              title: "Wiring Work",
              des: "Per meter charges",
              price: 250,
            ),
          ],
        ),
      ),
    );
  }
}
