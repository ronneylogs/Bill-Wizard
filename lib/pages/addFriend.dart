// For general Flutter.
import 'package:flutter/material.dart';

// For custom clippers.
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

TextEditingController friendEmail = TextEditingController();

class addFriendPage extends StatefulWidget {
  const addFriendPage({super.key});

  @override
  State<addFriendPage> createState() => _addFriendPageState();
}

class _addFriendPageState extends State<addFriendPage> {
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
        title: const Text('Add Friends', style: TextStyle(color: Colors.black)),
      ), //AppBar
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: WaveClipperOne(),
              child: Container(
                height: 200,
                color: Color.fromRGBO(0, 122, 255, 1),
                child: Center(child: Text("")),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "Enter the email address of the friend you wish to add",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: screenWidth * 0.06),
              ),
            ),
            // Text("Ensure your friend has an email associated with account",
            //     style: TextStyle(fontSize: screenWidth * 0.05))

            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: friendEmail,
                onChanged: (val) {
                  friendEmail.value = TextEditingValue(
                      text: val,
                      selection: TextSelection(
                          baseOffset: val.length, extentOffset: val.length));
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  hintText: 'ex. veronica@gmail.com',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                  width: screenWidth * 0.4,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(0, 122, 255, 1),
                      ),
                      onPressed: () {},
                      child: Text("Send Request",
                          style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Colors.white)))),
            ),
            Spacer(),
            Spacer(),
            Spacer(),
            Spacer(),
            ClipPath(
              clipper: WaveClipperOne(flip: true, reverse: true),
              child: Container(
                height: 200,
                color: Color.fromRGBO(0, 122, 255, 1),
                child: Center(child: Text("")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
