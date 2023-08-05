import 'package:contruction0/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'a_widgets/custom_button.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({super.key});

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/wellcome.jpg"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Text(
                  "Let's get started",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Text(
                  "Never a batter time than now to start",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                ),
                //custom button
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: CustomButton(
                        text: "Get Started",
                        onPressed: () {
                          Get.to(() => const Login());
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
