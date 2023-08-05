import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contruction0/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'core/utils.dart';
// import 'model.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  _SignUpState();

  bool showProgress = false;
  bool visible = false;
  bool confrimPass = false;
  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  bool _isObscure = true;
  File? file;
  var options = [
    'customer',
    'worker',
  ];
  var _currentItemSelected = "customer";
  var rool = "customer";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   title: const Text(
          //     "Registeration :",
          //     style: TextStyle(fontSize: 40),
          //   ),
          //   centerTitle: true,
          //   backgroundColor: Colors.deepPurpleAccent,
          // ),
          // backgroundColor: Colors.red,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.9),
                                BlendMode.dstATop),
                            image: const AssetImage("assets/s20.avif"))),
                    //    color: Colors.orangeAccent[700],
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.10,
                              ),
                              const Text(
                                "Register Now",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 40,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                              ),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Email',
                                  enabled: true,
                                  contentPadding: const EdgeInsets.only(
                                      left: 16.0, bottom: 8.0, top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.deepPurpleAccent),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.deepPurpleAccent),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Email cannot be empty";
                                  }
                                  if (!RegExp(
                                          "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                      .hasMatch(value)) {
                                    return ("Please enter a valid email");
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {},
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                              TextFormField(
                                obscureText: _isObscure,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        _isObscure
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      }),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Password',
                                  enabled: true,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 15.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                validator: (value) {
                                  RegExp regex = new RegExp(r'^.{6,}$');
                                  if (value!.isEmpty) {
                                    return "Password cannot be empty";
                                  }
                                  if (!regex.hasMatch(value)) {
                                    return ("please enter valid password min. 6 character");
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {},
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              TextFormField(
                                obscureText: _isObscure,
                                controller: confirmpassController,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        _isObscure
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      }),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Confirm Password',
                                  enabled: true,
                                  contentPadding: const EdgeInsets.only(
                                      left: 14.0, bottom: 8.0, top: 15.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                validator: (value) {
                                  if (confirmpassController.text !=
                                      passwordController.text) {
                                    return "Password did not match";
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {},
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rool : ",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  DropdownButton<String>(
                                    dropdownColor: Colors.white,
                                    isDense: true,
                                    isExpanded: false,
                                    iconEnabledColor: Colors.black,
                                    focusColor: Colors.black,
                                    items: options
                                        .map((String dropDownStringItem) {
                                      return DropdownMenuItem<String>(
                                        value: dropDownStringItem,
                                        child: Text(
                                          dropDownStringItem,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (newValueSelected) {
                                      setState(() {
                                        _currentItemSelected =
                                            newValueSelected!;
                                        rool = newValueSelected;
                                      });
                                    },
                                    value: _currentItemSelected,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    elevation: 5.0,
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    onPressed: () {
                                      CircularProgressIndicator();
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Login(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                    color: Colors.deepPurpleAccent,
                                    padding: EdgeInsets.all(8),
                                  ),
                                  MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0))),
                                      elevation: 5.0,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                      onPressed: () {
                                        setState(() {
                                          showProgress = true;
                                        });
                                        try {
                                          signUp(emailController.text,
                                              passwordController.text, rool);
                                        } catch (e) {
                                          Utils().toastMessage(e.toString());
                                        }
                                      },
                                      color: Colors.deepPurpleAccent,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 20),
                                      child: const Text(
                                        "Register",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password, String rool) async {
    const CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(email, rool)})
          // ignore: body_might_complete_normally_catch_error
          .catchError((e) {
        Utils().toastMessage(e.toString());
      });
    }
  }

  postDetailsToFirestore(String email, String rool) async {
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({
      'email': emailController.text,
      'rool': rool,
      'isVerified': "needData"
    });

    Utils().toastMessage("Registered Sucessfully");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }
}
