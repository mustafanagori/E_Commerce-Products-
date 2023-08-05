import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../a_widgets/text.dart';

class WorkerHome extends StatelessWidget {
  WorkerHome({super.key});
  final List<String> imageUrls = [
    "https://www.sanitary.pk/admin/assets/uploaded_images/51BpG1Z4XUL__AC_SL1000_.jpg",
    "https://static-01.daraz.pk/p/4d37ae8112edf894eaee087e975d84e9.png",
    "https://techmanistan.pk/wp-content/uploads/2022/10/5341b19a0b11407d13a3e86744b1c4e0-jpg.webp",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjyC84B6E-a86zvMq0U3u_6HSRR15J6FZWiJxXUubeZeN17zRwdVrrtaZENuza9yaPiD8&usqp=CAU",
  ];

  final List<String> texts = [
    "Gold shower set",
    "light Gold shower set",
    "Gold black shower set",
    "black shower set",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.circle_notifications),
            iconSize: 30,
            color: Colors.deepPurpleAccent,
          ),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Get.to(AddService());
          //       },
          //       icon: const Icon(
          //         Icons.add_business_rounded,
          //         color: Colors.green,
          //         size: 30,
          //       ))
          // ],

          // action button

          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyleWidget(
                text: "Dashboard Panel For Worker",
                fontSize: 18,
              ),
              Text('Al-Khaleej Tower badurabad karachi..',
                  style: TextStyle(fontSize: 14, color: Colors.black)),
            ],
          ),
          backgroundColor: Colors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextStyleWidget(
                text: "Wellcome to King Company ",
                fontSize: 25,
                color: Color.fromARGB(255, 123, 135, 129),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.020,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextStyleWidget(
                text: "Our Product",
                fontSize: 25,
                color: Color.fromARGB(255, 105, 150, 184),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.020,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.32,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: imageUrls.asMap().entries.map((entry) {
                final int index = entry.key;
                final String imageUrl = entry.value;
                final String text = texts[index];

                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 6.0),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)),
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.fill,
                              height: MediaQuery.of(context).size.height * 0.28,
                              width: double.infinity,
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            left: 50,
                            child: Text(
                              text,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
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
      width: MediaQuery.of(context).size.width * 0.45,
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
                fontSize: 17,
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
                    style: TextStyle(color: Colors.black),
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
                    style: TextStyle(color: Colors.black),
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
