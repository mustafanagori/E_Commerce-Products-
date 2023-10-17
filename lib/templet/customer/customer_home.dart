import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../a_widgets/text.dart';
import 'CleaningService/cleaing_service.dart';
import 'HomeService/home_service.dart';

class CustomerHome extends StatelessWidget {
  const CustomerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              //Get.to( DateTime2());
              //EasyLoading.showToast('you click this');
            },
            icon: const Icon(Icons.lock_clock_outlined),
            iconSize: 30,
            color: Colors.black,
          ),
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyleWidget(
                text: "Dashboard Panel ",
                fontSize: 14,
              ),
              Text('Office 505 Al-Khaleej Tower badurabad karachi..',
                  style: TextStyle(fontSize: 10, color: Colors.black)),
            ],
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            TextStyleWidget(
              text: "Wellcome to Darul Solution",
              fontSize: 18,
              color: Colors.grey.shade600,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            AutoSizeText(
              "Hellow,  Muhammad Raza",
              style: GoogleFonts.acme(
                textStyle: const TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(const HomeService());
                  },
                  child: const SerivceCard(
                    text: 'Home Service',
                    image: "assets/repair-tools.png",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(const CleaningService());
                  },
                  child: const SerivceCard(
                    text: 'Cleaning Service',
                    image: "assets/house-cleaning.png",
                  ),
                )
              ],
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton.small(
        //   onPressed: () {
        //     Get.to(OrderDetails());
        //   },
        //   backgroundColor: Colors.blueAccent.shade200,
        //   child: const Padding(
        //     padding: EdgeInsets.all(1.0),
        //     child: Icon(CupertinoIcons.shopping_cart),
        //   ),
        // ),
      ),
    );
  }
}

class SerivceCard extends StatelessWidget {
  final String text;
  final String image;
  const SerivceCard({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.22,
      width: MediaQuery.of(context).size.width * 0.48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(color: Colors.white, blurRadius: 1, offset: Offset(2, 2))
        ],
        color: const Color(0xFFEAEAEA),
      ),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          AutoSizeText(
            text,
            style: GoogleFonts.acme(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(20, 20),
                  textStyle: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                  backgroundColor: Colors.white,
                ),
                child: const FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "Residental",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(20, 20),
                  textStyle: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                  backgroundColor: Colors.white,
                ),
                child: const FittedBox(
                  fit: BoxFit.cover,
                  child: Text(
                    "COMMERICAL",
                    style: TextStyle(color: Colors.black, fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
          Image.asset(image,
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width * 0.3,
              fit: BoxFit.fill),
        ],
      ),
    );
  }
}
