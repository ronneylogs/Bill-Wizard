// This file is for the register page UI.

// Package for general Flutter.
import 'dart:io';
import 'package:billwizard/main.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package for toggle switch.
import 'package:toggle_switch/toggle_switch.dart';

// Package for Http.
import 'package:http/http.dart' as http;

// Package for camera and image.
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

// Packing for pathing.
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'login.dart';

// Function for adding receipt.
Future<void> sendRegisterWithFile() async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://10.0.2.2:3000/api/createUser'));

  // Add the file to the request
  var file = await http.MultipartFile.fromPath('image', imgPath);
  request.files.add(file);

  // Add additional fields
  request.fields['firstName'] = firstName.text;
  request.fields['lastName'] = lastName.text;
  request.fields['email'] = email.text;
  request.fields['ageTest'] = ageCheck.toString();
  request.fields['password'] = password.text;

  // Send the request
  var response = await request.send();

  // Handle the response
  if (response.statusCode == 200) {
    print('Request successful');
  } else {
    print('Request failed with status code: ${response.statusCode}');
  }
}

// Keeps track of image path.
late String imgPath;

// For Text Controllers
TextEditingController firstName = TextEditingController();
TextEditingController lastName = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController passwordConfirm = TextEditingController();

// To keep track of age.
int ageCheck = 0;

// To ensure fields are completed
bool firstName_confirm = false;
bool lastName_confirm = false;
bool email_confirm = false;
// bool age_confirm = false;
bool password_confirm = false;
bool passwordConfirm_confirm = false;

// To check interaction
bool firstNameInteract = false;
bool lastNameInteract = false;
bool emailInteract = false;

// To validate first and last name
String? validateFirstName() {
  if (firstNameInteract == true) {
    if (firstName.text == "") {
      firstName_confirm = false;
      return "Please enter valid name";
    }
    firstName_confirm = true;
    return null;
  }
  return null;
}

String? validateLastName() {
  if (lastNameInteract == true) {
    if (lastName.text == "") {
      lastName_confirm = false;
      return "Please enter valid name";
    }
    lastName_confirm = true;
    return null;
  }
  return null;
}

// To validate email
String? validateEmail() {
  if (emailInteract == true) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email.text);

    if (emailValid == false) {
      email_confirm = false;
      return "Please enter valid email address";
    }

    email_confirm = true;
    return null;
  }
  return null;
}

// To validate password.
String? validatePassword() {
  if (!(password.text.length > 5) && password.text.isNotEmpty) {
    password_confirm = false;
    return "Password should contain more than 5 characters";
  }

  if (password.text != passwordConfirm.text) {
    password_confirm = false;
    return "Passwords do not match";
  }

  password_confirm = true;
  return null;
}

// To validate passwords are the same
String? validatePasswordConfirm() {
  if (password.text != passwordConfirm.text) {
    passwordConfirm_confirm = false;
    return "Passwords do not match";
  }

  passwordConfirm_confirm = true;
  return null;
}

// Class for the register page.
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Used for receipt image
  File? _image;
  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      // final imageTemporary = File(image.path);

      final imagePermanent = await saveFilePermanently(image.path);
      imgPath = image.path;

      setState(() {
        this._image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    // For getting screen dimensions.
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: const Text('Register', style: TextStyle(color: Colors.black)),
      ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: firstName,
                              // keyboardType: TextInputType.number,
                              // inputFormatters: [
                              //   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                              // ],
                              onChanged: (val) {
                                firstName.value = TextEditingValue(
                                  text: val,
                                  selection: TextSelection.collapsed(
                                      offset: val.length),
                                );
                                firstNameInteract = true;
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                ),
                                hintText: ' ex. Veronica',
                                errorText: validateFirstName(),
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Last name.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            child: TextFormField(
                              controller: lastName,
                              // keyboardType: TextInputType.number,
                              // inputFormatters: [
                              //   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                              // ],
                              onChanged: (val) {
                                lastName.value = TextEditingValue(
                                  text: val,
                                  selection: TextSelection.collapsed(
                                      offset: val.length),
                                );
                                lastNameInteract = true;
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                ),
                                hintText: ' ex. Smith',
                                errorText: validateLastName(),
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    if (_image != null) ...[
                      Padding(
                        padding: const EdgeInsets.only(right: 20, top: 30),
                        child: Image.file(_image!,
                            width: screenWidth * 0.2,
                            height: screenWidth * 0.2,
                            fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: ElevatedButton(
                            onPressed: () {
                              getImage();
                            },
                            child: Text("Replace Image")),
                      ),
                    ] else ...[
                      Padding(
                        padding: const EdgeInsets.only(right: 55),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(88, 144, 255, 1)),
                            ),
                            onPressed: () {
                              getImage();
                            },
                            child: Text("Add Image")),
                      ),
                    ],
                  ],
                )
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
                    child: TextFormField(
                      controller: email,
                      // keyboardType: TextInputType.number,
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                      // ],
                      onChanged: (val) {
                        email.value = TextEditingValue(
                          text: val,
                          selection:
                              TextSelection.collapsed(offset: val.length),
                        );
                        emailInteract = true;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: ' ex. veronica@gmail.com',
                        errorText: validateEmail(),
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
                  initialLabelIndex: ageCheck,
                  totalSwitches: 2,
                  labels: [
                    'No',
                    'Yes',
                  ],
                  onToggle: (index) {
                    print('switched to: $index');
                    ageCheck = index!;
                    setState(() {});
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
                    child: TextFormField(
                      controller: password,
                      // keyboardType: TextInputType.number,
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                      // ],
                      onChanged: (val) {
                        password.value = TextEditingValue(
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
                        hintText: ' ex. password',
                        errorText: validatePassword(),
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
                      controller: passwordConfirm,
                      // keyboardType: TextInputType.number,
                      // inputFormatters: [
                      //   FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                      // ],
                      onChanged: (val) {
                        passwordConfirm.value = TextEditingValue(
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
                        hintText: ' ex. Confirm password',
                        errorText: validatePasswordConfirm(),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            if (firstName_confirm == false ||
                lastName_confirm == false ||
                email_confirm == false ||
                password_confirm == false ||
                passwordConfirm_confirm == false) ...[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Please enter all fields before continuing.",
                    style: TextStyle(
                        color: Colors.red, fontSize: screenWidth * 0.05)),
              )
            ],

            if (ageCheck == 0) ...[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("You must 18 or older in order to use this app",
                    style: TextStyle(
                        color: Colors.red, fontSize: screenWidth * 0.05)),
              )
            ],

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromRGBO(88, 144, 255, 1)),
                      ),
                      onPressed: () async {
                        // For Http;
                        // var baseUrl = Uri.parse("http://10.0.2.2:3000/api");
                        // var response = await http.get(baseUrl);
                        // print(response.body);

                        if (firstName_confirm == false ||
                            lastName_confirm == false ||
                            email_confirm == false ||
                            password_confirm == false ||
                            passwordConfirm_confirm == false ||
                            ageCheck == 0) {
                          setState(() {});
                        } else {
                          sendRegisterWithFile();

                          setState(() {
                            // UserSimplePreferences.setRememberUser(false);
                            // UserSimplePreferences.setRememberUsername("");
                            // UserSimplePreferences.setRememberPassword("");
                            rememberUser = false;
                            usernameLogIn.text = "";
                            passwordLogIn.text = "";
                          });

                          Navigator.pop(context);
                        }
                      },
                      child: Text("Register")),
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}
