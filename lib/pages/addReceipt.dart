// Package for general Flutter.
import 'package:flutter/material.dart';

// Package for date and time picker.
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/services.dart';

// For Text Controllers
TextEditingController location = TextEditingController();
TextEditingController time = TextEditingController();
TextEditingController subTotal = TextEditingController();
TextEditingController tax = TextEditingController();
TextEditingController tip = TextEditingController();

double grandTotal = 0;

class addReceipt extends StatefulWidget {
  const addReceipt({super.key});

  @override
  State<addReceipt> createState() => _addReceiptState();
}

class _addReceiptState extends State<addReceipt> {
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
                  padding: const EdgeInsets.only(bottom: 15, left: 8, right: 8),
                  child: Container(
                    width: screenWidth * 0.5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: 'ex. Boston Pizza',
                        prefixIcon: Icon(Icons.store),
                      ),
                    ),
                  ),
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
                    selectedMonth: 10, // optional
                    selectedYear: 2023, // optional
                    onChangedDay: (value) => print('onChangedDay: $value'),
                    onChangedMonth: (value) => print('onChangedMonth: $value'),
                    onChangedYear: (value) => print('onChangedYear: $value'),
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
                      onSubmitted: (val) {
                        setState(() {
                          subTotal.value = TextEditingValue(
                              text: val,
                              selection: TextSelection(
                                  baseOffset: val.length,
                                  extentOffset: val.length));
                          subTotal.text = val;
                          grandTotal = grandTotal + double.parse(val);
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
                              onSubmitted: (val) {
                                setState(() {
                                  tax.value = TextEditingValue(
                                      text: val,
                                      selection: TextSelection(
                                          baseOffset: val.length,
                                          extentOffset: val.length));
                                  tax.text = val;
                                  grandTotal = grandTotal + double.parse(val);
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
                              onSubmitted: (val) {
                                setState(() {
                                  tip.value = TextEditingValue(
                                      text: val,
                                      selection: TextSelection(
                                          baseOffset: val.length,
                                          extentOffset: val.length));
                                  tip.text = val;
                                  grandTotal = grandTotal + double.parse(val);
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
                Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 8, bottom: 10),
                      child: Text(
                        textAlign: TextAlign.start,
                        "${grandTotal}",
                        style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            color: Colors.grey[750]),
                      ),
                    ),
                  ],
                )
                // Tax
              ],
            ),
          ),
        ),
      ),
    );
  }
}
