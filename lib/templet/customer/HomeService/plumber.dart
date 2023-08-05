import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../a_widgets/service_card.dart';
import '../../../../a_widgets/text.dart';
import 'home_service.dart';

class PlumberService extends StatefulWidget {
  const PlumberService({super.key});

  @override
  State<PlumberService> createState() => _PlumberServiceState();
}

class _PlumberServiceState extends State<PlumberService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: AppBar(
          title: const TextStyleWidget(text: "Plumber Service..", fontSize: 20),
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
                    TextStyleWidget(text: "choose From below", fontSize: 20)),
            //list 1
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/plumber/watertank.jpg",
              title: "Water Tank Installation",
              des: "Water Tank 100 to 150 gallon",
              price: 2500,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/plumber/waal.jpg",
              title: "Wall Installation",
              des: "Per Wall",
              price: 350,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/plumber/sinkpipe.jpg",
              title: "Sink pipe Installation",
              des: "Per pipe",
              price: 650,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/plumber/sink.jpg",
              title: "Sink pipe Installation",
              des: "Per pipe with Null",
              price: 450,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/plumber/shoer.jpg",
              title: "Shoer Installation",
              des: "Per Shoer",
              price: 750,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/plumber/pipeleakage.jpg",
              title: "Pipe Leakage",
              des: "Per Leakage join ",
              price: 250,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/plumber/null.jpg",
              title: "Null Installation",
              des: "Per Null",
              price: 150,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const ServiceCardWidget(
              image: "assets/plumber/drainpipe.jpg",
              title: "Drain Pipe Repairing",
              des: "Per pipe",
              price: 2600,
            ),

            //list 1
          ],
        ),
      ),
    );
  }
}
