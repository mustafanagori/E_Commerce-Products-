import 'package:contruction0/core/utils.dart';
import 'package:contruction0/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController forgotController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Forgot password",
            style: TextStyle(),
          ),
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.dstATop),
                    image: const AssetImage("assets/s20.avif"))),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              margin: const EdgeInsets.only(top: 150, right: 12, left: 12),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("assets/otp.png"),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: forgotController,
                    decoration: InputDecoration(
                      hintText: "Enter your register email",
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 15.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.deepPurpleAccent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.deepPurpleAccent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 8,
                          fixedSize: const Size(180, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: () async {
                          var forgotemail = forgotController.text.trim();

                          try {
                            await FirebaseAuth.instance
                                .sendPasswordResetEmail(email: forgotemail)
                                .then((value) => {
                                      Utils().toastMessage('Email send !'),
                                      Get.to(() => const Login()),
                                    });
                          } on FirebaseAuthException catch (e) {
                            Utils().toastMessage("$e");
                          }
                        },
                        child: const Text(
                          "Reset Password !",
                          style: TextStyle(fontSize: 17),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
