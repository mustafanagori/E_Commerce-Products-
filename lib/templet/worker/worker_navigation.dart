import 'package:contruction0/templet/worker/service.dart';
import 'package:contruction0/templet/worker/worker_home.dart';
import 'package:contruction0/templet/worker/worker_order.dart';
import 'package:contruction0/templet/worker/worker_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/customer_navigation_controller.dart';

// ignore: must_be_immutable
class WorkerNavigation extends StatelessWidget {
  WorkerNavigation({super.key});

  WorkerNavigationController bottomNavigationContoller =
      Get.put(WorkerNavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: IndexedStack(
            index: bottomNavigationContoller.selectedIndex.value,
            children: [
              WorkerHome(),
              ServiceScreen(),
              WorkerOrder(),
              WorkerProfile(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            currentIndex: bottomNavigationContoller.selectedIndex.value,
            onTap: bottomNavigationContoller.changeIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_alert),
                label: "Add service",
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shop),
                label: "Order",
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: Colors.white,
              ),
            ]),
      ),
    );
  }
}
