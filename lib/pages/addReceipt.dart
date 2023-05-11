// This file is for the receipt page UI.

// Package for general Flutter.
import 'dart:io';
import 'dart:async';

import 'package:billwizard/pages/register.dart';
import 'package:flutter/material.dart';
// import 'dart.io';

// Package for date and time picker.
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/services.dart';

// Package for camera and image.
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

// Packing for pathing.
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

// Package for Http.
import 'package:http/http.dart' as http;

// Function for adding subtotal,tax and tip.
void addTotal() {
  grandTotal = 0;
  if (subTotal.text != "") {
    grandTotal += double.parse(subTotal.text);
  }
  if (tax.text != "") {
    grandTotal += double.parse(tax.text);
  }
  if (tip.text != "") {
    grandTotal += double.parse(tip.text);
  }
}

// For Text Controllers
TextEditingController location = TextEditingController();
TextEditingController time = TextEditingController();
TextEditingController subTotal = TextEditingController();
TextEditingController tax = TextEditingController();
TextEditingController tip = TextEditingController();

String month = "January";
String day = "14";
String year = "2023";

// Variable to keep track of the grandTotal
double grandTotal = 0;

class addReceipt extends StatefulWidget {
  const addReceipt({super.key});

  @override
  State<addReceipt> createState() => _addReceiptState();
}

class _addReceiptState extends State<addReceipt> {
  // Used for receipt image
  File? _image;
  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      // final imageTemporary = File(image.path);
      final imagePermanent = await saveFilePermanently(image.path);

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

    // void initState() {
    //   super.initState();
    //   // update value in listener
    //   subTotal.addListener(() {
    //     setState(() {
    //       subTotal.text = "your value";
    //     });
    //   });
    // }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: const Text('Receipts', style: TextStyle(color: Colors.black)),
      ), //AppBar
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // LOCATION
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8, right: 8, bottom: 10),
                          child: Text(
                            "Location",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.05,
                                color: Colors.grey[750]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, left: 8, right: 8),
                          child: Container(
                            width: screenWidth * 0.5,
                            child: TextFormField(
                              controller: location,
                              onChanged: (val) {
                                location.value = TextEditingValue(
                                    text: val,
                                    selection: TextSelection(
                                        baseOffset: val.length,
                                        extentOffset: val.length));
                              },
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                ),
                                hintText: 'ex. Boston Pizza',
                                prefixIcon: Icon(Icons.store),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        if (_image != null) ...[
                          Padding(
                            padding: const EdgeInsets.only(right: 55, top: 30),
                            child: Image.file(_image!,
                                width: screenWidth * 0.2,
                                height: screenWidth * 0.2,
                                fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 55),
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
                    ),
                  ],
                ),

                // WHEN
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 8, right: 8, bottom: 10),
                  child: Text(
                    "When",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.05,
                        color: Colors.grey[750]),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 0, left: 8, right: 8),
                  child: DropdownDatePicker(
                    locale: "en",
                    inputDecoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        helperText: '',
                        contentPadding: const EdgeInsets.all(1),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(10))), // optional
                    isDropdownHideUnderline: true, // optional
                    isFormValidator: true, // optional
                    startYear: 2000, // optional
                    endYear: 2023, // optional
                    width: 10, // optional
                    selectedDay: 14, // optional
                    selectedMonth: 1, // optional
                    selectedYear: 2023, // optional
                    onChangedDay: (value) => day = value!,
                    onChangedMonth: (value) => month = value!,
                    onChangedYear: (value) => year = value!,
                    //boxDecoration: BoxDecoration(
                    // border: Border.all(color: Colors.grey, width: 1.0)), // optional
                    // showDay: false,// optional
                    // dayFlex: 2,// optional
                    // locale: "zh_CN",// optional
                    // hintDay: 'Day', // optional
                    // hintMonth: 'Month', // optional
                    // hintYear: 'Year', // optional
                    // hintTextStyle: TextStyle(color: Colors.grey), // optional
                  ),
                ),

                // SUBTOTAL
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 8, right: 8, bottom: 10),
                  child: Text(
                    "Subtotal",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.05,
                        color: Colors.grey[750]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15, left: 8, right: 8),
                  child: Container(
                    width: screenWidth * 0.5,
                    child: TextField(
                      controller: subTotal,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}'))
                      ],
                      onChanged: (val) {
                        subTotal.value = TextEditingValue(
                            text: val,
                            selection: TextSelection(
                                baseOffset: val.length,
                                extentOffset: val.length));
                        setState(() {
                          // subTotal.text = val;
                          // grandTotal = 0;
                          // if (tax.text != "") {
                          //   grandTotal += double.parse(tax.text);
                          // }
                          // if (tip.text != "") {
                          //   grandTotal += double.parse(tip.text);
                          // }
                          // if (subTotal.text != "") {
                          //   grandTotal += double.parse(subTotal.text);
                          // }
                          addTotal();

                          // grandTotal = double.parse(tax.text)! +
                          //     double.parse(tip.text) +
                          //     double.parse(val);
                        });
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: ' ex. 20.82',
                        prefixIcon: Icon(Icons.attach_money),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8, right: 8, bottom: 10),
                          child: Text(
                            "Government tax",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.05,
                                color: Colors.grey[750]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, left: 8, right: 8),
                          child: Container(
                            width: screenWidth * 0.45,
                            child: TextField(
                              controller: tax,
                              onChanged: (val) {
                                setState(() {
                                  tax.value = TextEditingValue(
                                      text: val,
                                      selection: TextSelection(
                                          baseOffset: val.length,
                                          extentOffset: val.length));

                                  addTotal();
                                });
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d+\.?\d{0,2}'))
                              ],
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                ),
                                hintText: ' ex. 5.23',
                                prefixIcon: Icon(Icons.attach_money),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 0, right: 8, bottom: 10),
                          child: Text(
                            textAlign: TextAlign.start,
                            "Tips",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.05,
                                color: Colors.grey[750]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15, left: 8, right: 8),
                          child: Container(
                            width: screenWidth * 0.45,
                            child: TextField(
                              controller: tip,
                              onChanged: (val) {
                                setState(() {
                                  tip.value = TextEditingValue(
                                      text: val,
                                      selection: TextSelection(
                                          baseOffset: val.length,
                                          extentOffset: val.length));

                                  addTotal();
                                });
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d+\.?\d{0,2}'))
                              ],
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.0),
                                ),
                                hintText: ' ex. 6.32',
                                prefixIcon: Icon(Icons.attach_money),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8, right: 8, bottom: 10),
                      child: Text(
                        textAlign: TextAlign.start,
                        "Total",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.05,
                            color: Colors.grey[750]),
                      ),
                    ),
                  ],
                ),

                // Total
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 8, bottom: 10),
                      child: Text(
                        textAlign: TextAlign.start,
                        "${grandTotal.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            color: Colors.grey[750]),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 8, bottom: 10),
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Color.fromRGBO(88, 144, 255, 1)),
                            ),
                            onPressed: () async {
                              time.text = "${month} ${day} ${year}";
                              Map req = new Map();
                              req = {
                                "location": location.text,
                                "when": time.text,
                                "subTotal": subTotal.text,
                                "tax": tax.text,
                                "tip": tip.text,
                              };
                              var baseUrl = Uri.parse(
                                  "http://10.0.2.2:3000/api/createReceipt");
                              var response =
                                  await http.post(baseUrl, body: req);

                              print(response.body);
                              Navigator.pop(context);
                            },
                            child: Text("Submit",
                                style:
                                    TextStyle(fontSize: screenWidth * 0.04)))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
