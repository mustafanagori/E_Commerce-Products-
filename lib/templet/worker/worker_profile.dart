import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contruction0/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../a_widgets/custom_button.dart';
import '../../core/utlis.dart';

class WorkerProfile extends StatefulWidget {
  const WorkerProfile({super.key});

  @override
  State<WorkerProfile> createState() => _WorkerProfileState();
}

class _WorkerProfileState extends State<WorkerProfile> {
  String name = "";
  String email = "";
  String address = "";
  String contact = "";
  String experience = "";
  void getData() async {
    User? user = FirebaseAuth.instance.currentUser;
    var var1 = await FirebaseFirestore.instance
        .collection("worker")
        .doc(user?.uid)
        .get();
    setState(() {
      name = var1.data()?['name'];
      address = var1.data()?['address'];
      contact = var1.data()?['contact'];
      experience = var1.data()?['experience'];
    });

    // for worker email
    var var2 = await FirebaseFirestore.instance
        .collection("users")
        .doc(user?.uid)
        .get();
    setState(() {
      email = var2.data()?['email'];
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  String currentImage = "assets/profile1.avif";

  void changeImage() {
    setState(() {
      if (currentImage == "assets/profile1.avif") {
        currentImage = "assets/men.avif";
      } else {
        currentImage = "assets/profile1.avif";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Worker Profile",
            style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.normal),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  image: const AssetImage("assets/sofa/1sofa.jpg"))),
          child: ListView(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.18,
            ),
            // GestureDetector(
            //   onTap: changeImage,
            //   child: Center(
            //     child: CircleAvatar(
            //       radius: 60,
            //       backgroundImage: AssetImage(currentImage),
            //     ),
            //   ),
            // ),
            const Padding(
              padding: EdgeInsets.only(top: 40, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Name:",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name,
                    style: const TextStyle(fontSize: 16),
                  )),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    email,
                    style: const TextStyle(fontSize: 16),
                  )),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Phone Number',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    contact,
                    style: const TextStyle(fontSize: 16),
                  )),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Address',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    address,
                    style: const TextStyle(fontSize: 16),
                  )),
            ),
            const Divider(),
            const Padding(
              padding: EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Experience',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3, left: 6),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    experience,
                    style: const TextStyle(fontSize: 16),
                  )),
            ),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: CustomButton(
                      text: "Logout",
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Utils2.toastMessage("You logout");
                        Get.to(const Login());
                      })),
            )
          ]),
        )));
  }
}
