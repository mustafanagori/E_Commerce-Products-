import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils.dart';
import '../../login.dart';
import '../../splashscreen.dart';

class WorkerInfo extends StatefulWidget {
  const WorkerInfo({super.key});

  @override
  State<WorkerInfo> createState() => _WorkerInfoState();
}

class _WorkerInfoState extends State<WorkerInfo> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  final currentUserid = FirebaseAuth.instance.currentUser!.uid;
  String? gender;

  final firstNameController = TextEditingController();
  final contactController = TextEditingController();
  final addressController = TextEditingController();
  final cnicController = TextEditingController();
  final experienceController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: const Text('Worker Information'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Utils().toastMessage("You logout");
                Get.to(const Login());
              },
              icon: const Icon(Icons.login_sharp)),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4), BlendMode.dstATop),
                    image: AssetImage("assets/s20.avif"))),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          controller: firstNameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: MediaQuery.of(context).size.width *
                                          0.04,
                                      color: Colors.red),
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: "Worker Name"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "cannot be empty";
                            }
                            if (value.length < 3) {
                              return "minimum length of 3";
                            }
                            if (value.contains(RegExp(r'[0-9]'))) {
                              return "cannot contain numbers";
                            }
                            if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                              return "must contain only alphabetic characters and spaces";
                            }
                            return null;
                          },
                          onChanged: (value) {},
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              maxLength: 11,
                              controller: contactController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          color: Colors.red),
                                      borderRadius: BorderRadius.circular(20)),
                                  labelText: "Contact No"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "cannot be empty";
                                }
                                if (value.length != 11 ||
                                    !RegExp(r'^[0-9]+$').hasMatch(value)) {
                                  return "Invalid contain 11 digits";
                                }
                                return null;
                              },
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              maxLength: 11,
                              controller: experienceController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.04,
                                          color: Colors.red),
                                      borderRadius: BorderRadius.circular(20)),
                                  labelText: " Experience"),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "cannot be empty";
                                }

                                return null;
                              },
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          maxLength: 13,
                          controller: cnicController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: MediaQuery.of(context).size.width *
                                          0.04,
                                      color: Colors.red),
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: "Worker CNIC"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "cannot be empty";
                            }
                            if (value.length != 13 ||
                                !RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return "Invalid contain 13 digits";
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          controller: addressController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: MediaQuery.of(context).size.width *
                                          0.04,
                                      color: Colors.red),
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: "Worker Address "),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "cannot be empty";
                            }

                            return null;
                          },
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                      ),
                      RadioListTile(
                        title: const Text("Male"),
                        value: "male",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Female"),
                        value: "female",
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.5,
                    //   width: getProportionateScreenWidth(15)0,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurpleAccent,
                        // side: BorderSide(
                        //   width: getProportionateScreenWidth(1).0,
                        //   color: Colors.blueAccent,
                        // ),
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          await FirebaseFirestore.instance
                              .collection("worker")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .set({
                            "name": firstNameController.text.toString(),
                            "contact": contactController.text.toString(),
                            "address": addressController.text.toString(),
                            "experience": experienceController.text.toString(),
                            "gender": gender.toString(),
                          }).then((value) async {
                            Utils().toastMessage("Data Added");
                            //Get.put(CustomerController());

                            await FirebaseFirestore.instance
                                .collection("users")
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .update({
                              "isVerified": "verified",
                            });

                            Get.off(SplashScreen());
                            setState(() {
                              loading = false;
                            });
                          }).onError((error, stackTrace) {
                            Utils().toastMessage(error.toString());
                            setState(() {
                              loading = false;
                            });
                          });
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
