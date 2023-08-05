import 'package:contruction0/templet/customer/customer_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../a_widgets/service_card.dart';
import '../../../../a_widgets/text.dart';
import '../../../../core/utlis.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 241, 241),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextStyleWidget(text: "Address", fontSize: 15),
                        TextStyleWidget(
                            text:
                                "Al-Khaleej floor 5 office 505 Tower badurabad karachi ",
                            fontSize: 14),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const TextStyleWidget(text: "Service List", fontSize: 17),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: ServiceCardWidget(
                    image: "assets/sofa/1sofa.jpg",
                    title: "Sofa Cleaning",
                    des: "Single Sofa Cleaning  ",
                    price: 300),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: ServiceCardWidget(
                    image: "assets/chair/6chair.jpg",
                    title: "Chair Cleaning",
                    des: "Single chair Cleaning  ",
                    price: 450),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.14,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 244, 241, 241),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextStyleWidget(
                                text: "Sofa Cleaning", fontSize: 15),
                            TextStyleWidget(text: "300 * 1", fontSize: 15),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextStyleWidget(
                                text: "Chair Cleaning", fontSize: 15),
                            TextStyleWidget(text: "450 * 1", fontSize: 15),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextStyleWidget(text: "Total Price", fontSize: 15),
                            TextStyleWidget(text: "750", fontSize: 15),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ElevatedButton(
                    onPressed: () {
                      Utils2.toastMessage("your order has been place");
                      Get.to(CustumerNavigation());
                    },
                    child: const Text(
                      "Place Order",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
