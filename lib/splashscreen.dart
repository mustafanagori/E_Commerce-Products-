import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contruction0/login.dart';
import 'package:contruction0/templet/customer/customer_navigation.dart';
import 'package:contruction0/templet/customer/custumer_info.dart';
import 'package:contruction0/templet/worker/worker_info.dart';
import 'package:contruction0/templet/worker/worker_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controller/customer_navigation_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put((WorkerNavigationController));
    Get.put(WorkerNavigationController());
    //Get.put(CustomerController());
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      User? user = FirebaseAuth.instance.currentUser;

      FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .get()
          .then((DocumentSnapshot? snapshot) {
        if (snapshot != null && snapshot.exists) {
          final data = snapshot.data() as Map<String, dynamic>;

          if (data["rool"] == "customer") {
            if (data["isVerified"] == "needData") {
              Timer(
                  const Duration(seconds: 3),
                  () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          (const CustomerInfo()))));
            } else {
              Timer(
                  const Duration(seconds: 3),
                  () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          (CustumerNavigation()))));
            }
          }
          // for Worker
          else if (data["rool"] == "worker") {
            if (data["isVerified"] == "needData") {
              Timer(
                  const Duration(seconds: 3),
                  () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          (const WorkerInfo()))));
            } else {
              Timer(
                  const Duration(seconds: 3),
                  () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          (WorkerNavigation()))));
            }
          }
          // End worker
        }
      });
    }
    // if user Login
    else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => (Login()))));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('assets/vc1.gif')],
      ),
    );
  }
}
