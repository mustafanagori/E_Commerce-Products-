import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../a_widgets/service_card.dart';
import '../../../../a_widgets/text.dart';
import 'home_service.dart';

class AcService extends StatefulWidget {
  const AcService({super.key});

  @override
  State<AcService> createState() => _AcServiceState();
}

class _AcServiceState extends State<AcService> {
  int _currentIndex = 0;
  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.menu),
    Icon(Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: AppBar(
          title: const TextStyleWidget(text: "Ac Service", fontSize: 20),
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
                margin: const EdgeInsets.only(right: 25, left: 25),
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
                    TextStyleWidget(text: "choose From below", fontSize: 20)),
            //list 1
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/acService/outerGas.jpg",
              title: "Outer Gas Installation and serivce available book know",
              des: "1 to 2.5 Ton Gas Installtion and will give your 100%",
              price: 1500,
            ),
            //list 1
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/acService/AcService2.jpg",
              title: "AC Master Service",
              des: "AC serice 1 to 10 Ton",
              price: 6500,
            ),
            //list 1
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/acService/AcInstallation2.jpg",
              title: "AC Installation",
              des: "AC Installation 1 to 10 Ton",
              price: 200,
            ),
            //list 1
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/acService/AcRepairing.jpg",
              title: "AC Repairing",
              des: "AC Repairing 1 to 2 Ton",
              price: 3500,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/acService/outerGas.jpg",
              title: "Outer Repairing",
              des: "AC Repairing 1 to 2 Ton",
              price: 3500,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Order', icon: Icon(Icons.shop)),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
