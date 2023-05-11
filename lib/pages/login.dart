// This file is for login page UI.

// Package for general Flutter.
import 'package:billwizard/main.dart';
import 'package:billwizard/pages/register.dart';
import 'package:flutter/material.dart';

// Package for logger.
import 'package:logger/logger.dart';

// Package for Http.
import 'package:http/http.dart' as http;

// Package for other pages.
import '../utilities/card.dart';
import '../utilities/userSharedPreferences.dart';

// For username text input.
TextEditingController usernameLogIn = TextEditingController();

// For password text input.
TextEditingController passwordLogIn = TextEditingController();

// Flag for if user enters the wrong password.
bool logInError = false;

class Login extends StatefulWidget {
  Login(bool rememberUser, {super.key}) {
    if (rememberUser) {
      print("hello");
      print(username_shared);
      print(password_shared);
      usernameLogIn.text = username_shared;
      passwordLogIn.text = password_shared;
    } else {
      usernameLogIn.text = "";
      passwordLogIn.text = "";
    }
  }

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    // For getting screen dimensions.
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Bill Wizard",
                      style: TextStyle(
                          fontSize: screenWidth * 0.12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text("Start your money saving journey now.",
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          color: Colors.black,
                        )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: screenHeight * 0.02),
              child: loginCard(
                Container(
                    child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.1)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text("Email",
                            style: TextStyle(fontSize: screenWidth * 0.05)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Container(
                          width: screenWidth * 0.7,
                          height: screenHeight * 0.1,
                          child: TextField(
                            controller: usernameLogIn,
                            // keyboardType: TextInputType.number,
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                            // ],
                            onChanged: (val) {
                              usernameLogIn.value = TextEditingValue(
                                text: val,
                                selection:
                                    TextSelection.collapsed(offset: val.length),
                              );
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              hintText: 'email',
                              prefixIcon: Icon(Icons.person),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text("Password",
                            style: TextStyle(fontSize: screenWidth * 0.05)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Container(
                          width: screenWidth * 0.7,
                          // height: screenHeight * 0.1,
                          child: TextField(
                            obscureText: true,
                            controller: passwordLogIn,
                            // keyboardType: TextInputType.number,
                            // inputFormatters: [
                            //   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                            // ],

                            onChanged: (val) {
                              passwordLogIn.value = TextEditingValue(
                                text: val,
                                selection:
                                    TextSelection.collapsed(offset: val.length),
                              );
                              setState(() {});
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                              ),
                              hintText: 'password',
                              prefixIcon: Icon(Icons.password_outlined),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  if (logInError) ...[
                    Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, bottom: 15.08),
                          child: Text("Incorrect password or email.",
                              style: TextStyle(color: Colors.red)),
                        )
                      ],
                    )
                  ],
                  Row(children: [
                    Checkbox(
                      checkColor: Colors.white,
                      // fillColor: MaterialStateProperty.resolveWith(getColor),
                      value: rememberUser,
                      onChanged: (bool? value) {
                        setState(() {
                          rememberUser = value!;
                          UserSimplePreferences.setRememberUser(rememberUser);
                        });
                      },
                    ),
                    Text("Remember me?")
                  ]),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, bottom: 40),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Register();
                            }));
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                color: Colors.blue),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: SizedBox(
                          width: screenWidth * 0.7,
                          height: screenHeight * 0.045,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromRGBO(88, 144, 255, 1)),
                              ),
                              onPressed: () async {
                                if (rememberUser) {
                                  UserSimplePreferences.setRememberUsername(
                                      usernameLogIn.text);
                                  UserSimplePreferences.setRememberPassword(
                                      passwordLogIn.text);
                                } else {
                                  UserSimplePreferences.setRememberUsername("");
                                  UserSimplePreferences.setRememberPassword("");
                                }
                                Map req = new Map();
                                req = {
                                  "email": usernameLogIn.text,
                                  "password": passwordLogIn.text,
                                };
                                var baseUrl =
                                    Uri.parse("http://10.0.2.2:3000/api/logIn");
                                var response =
                                    await http.post(baseUrl, body: req);

                                print(response.body);

                                if (response.body ==
                                    "Incorrect password or email.") {
                                  setState(() {
                                    logInError = true;
                                  });
                                } else {
                                  setState(() {
                                    logInError = false;
                                  });

                                  // Store new email
                                  globalInfo.email = usernameLogIn.text;

                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return NavBar(title: "hi");
                                  }));
                                }
                              },
                              child: Text("Log in")),
                        ),
                      )
                    ],
                  )
                ])),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
