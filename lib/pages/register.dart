// This file is for the register page UI.

// Package for general Flutter.
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package for toggle switch.
import 'package:toggle_switch/toggle_switch.dart';

// Package for Http.
import 'package:http/http.dart' as http;

// For Text Controllers
TextEditingController firstName = TextEditingController();
TextEditingController lastName = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController passwordConfirm = TextEditingController();

// To keep track of age.
int ageCheck = 0;

// Class for the register page.
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    // For getting screen dimensions.
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                  child: Text("Register",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.075)),
                ),
              ],
            ),

            // First name
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("First Name",
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    width: screenWidth * 0.5,
                    child: TextField(
                      controller: firstName,
                      // keyboardType: TextInputType.number,
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                      // ],
                      onSubmitted: (val) {
                        setState(() {
                          firstName.value = TextEditingValue(
                              text: val,
                              selection: TextSelection(
                                  baseOffset: val.length,
                                  extentOffset: val.length));
                          firstName.text = val;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: ' ex. Veronica',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Last name.
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Last Name",
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    width: screenWidth * 0.5,
                    child: TextField(
                      controller: lastName,
                      // keyboardType: TextInputType.number,
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                      // ],
                      onSubmitted: (val) {
                        setState(() {
                          lastName.value = TextEditingValue(
                              text: val,
                              selection: TextSelection(
                                  baseOffset: val.length,
                                  extentOffset: val.length));
                          lastName.text = val;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: ' ex. Smith',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Email
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Email",
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    width: screenWidth * 0.8,
                    child: TextField(
                      controller: firstName,
                      // keyboardType: TextInputType.number,
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                      // ],
                      onSubmitted: (val) {
                        setState(() {
                          firstName.value = TextEditingValue(
                              text: val,
                              selection: TextSelection(
                                  baseOffset: val.length,
                                  extentOffset: val.length));
                          firstName.text = val;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: ' ex. veronica@gmail.com',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Age
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Are you over 18 years of age?",
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Text('Are You Married?'),
                SizedBox(
                  width: 20,
                ),
                ToggleSwitch(
                  initialLabelIndex: 0,
                  totalSwitches: 2,
                  labels: [
                    'No',
                    'Yes',
                  ],
                  onToggle: (index) {
                    print('switched to: $index');
                    ageCheck = index!;
                  },
                ),
              ],
            ),

            // Password
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Password",
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    width: screenWidth * 0.8,
                    child: TextField(
                      controller: password,
                      // keyboardType: TextInputType.number,
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                      // ],
                      onSubmitted: (val) {
                        setState(() {
                          password.value = TextEditingValue(
                              text: val,
                              selection: TextSelection(
                                  baseOffset: val.length,
                                  extentOffset: val.length));
                          password.text = val;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: ' ex. password',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Confirm Password",
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.05)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    width: screenWidth * 0.8,
                    child: TextField(
                      controller: firstName,
                      // keyboardType: TextInputType.number,
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                      // ],
                      onSubmitted: (val) {
                        setState(() {
                          firstName.value = TextEditingValue(
                              text: val,
                              selection: TextSelection(
                                  baseOffset: val.length,
                                  extentOffset: val.length));
                          firstName.text = val;
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: ' ex. Confirm password',
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        // var baseUrl = Uri.parse("http://localhost:3000/api");
                        var baseUrl = Uri.parse("http://10.0.2.2:3000/api");
                        var response = await http.get(baseUrl);

                        print(response.body);
                      },
                      child: Text("Submit")),
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}
