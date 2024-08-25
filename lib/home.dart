import 'package:contactapp/container_style.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController textController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  int counter = 0;
  List<bool> visibilityList = [false, false, false];
  List<ContainerStyle> containers = [];

  void addItem() {
    if (counter < 3) {
      setState(() {
        String name = textController.text;
        String phone = phoneController.text;

        visibilityList[counter] = true;
        containers.add(ContainerStyle(name: name, phone: phone));

        counter++;

        textController.clear();
        phoneController.clear();
      });
    }
  }

  void removeItem() {
    if (counter > 0) {
      setState(() {
        counter--;
        visibilityList[counter] = false;
        containers.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff9D9D9D),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                  labelText: 'Enter Your Name Here',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(Icons.edit),
                  suffixIconColor: Color(0xff2195F1),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
            SizedBox(height: 20),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                  labelText: 'Enter Your Phone Here',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: Icon(Icons.phone),
                  suffixIconColor: Color(0xff2195F1),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: addItem,
                    child: Text(
                      'Add',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(width: 3),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    onPressed: removeItem,
                    child: Text(
                      'Delete',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: containers.map((container) {
                return Column(
                  children: [
                    container,
                    SizedBox(height: 20),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
