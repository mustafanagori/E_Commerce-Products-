import 'package:contruction0/templet/customer/customer_home.dart';
import 'package:contruction0/templet/customer/customer_profile.dart';
import 'package:contruction0/templet/customer/order_details.dart';
import 'package:contruction0/templet/customer/view_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/customer_navigation_controller.dart';

// ignore: must_be_immutable
class CustumerNavigation extends StatelessWidget {
  CustumerNavigation({super.key});

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
              CustomerHome(),
              OrderDetails(),
              ViewService(),
              CustumerProfile(),
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
                icon: Icon(Icons.shop),
                label: "Order",
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.desktopcomputer),
                label: "Service",
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
