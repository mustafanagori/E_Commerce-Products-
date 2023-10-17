import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'HomeService/home_service.dart';

class OrderSchedule extends StatelessWidget {
  const OrderSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.blue.shade50,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "No Schedule Yet",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(const HomeService());
                },
                child: const Text(
                  "Book Now",
                ))
          ],
        ),
      ),
    );
  }
}
