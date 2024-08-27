import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'container_style.dart'; // تأكد من استيراد الـ ContainerStyle

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController textController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String errorMessage = '';

  int counter = 0;
  List<ContainerStyle> containers = [];

  void addItem() {
    if (counter < 3) {
      setState(() {
        if (textController.text.isEmpty || phoneController.text.isEmpty) {
          errorMessage = 'من فضلك اكتب حاجة في الحقل!';
        } else {
          String name = textController.text;
          String phone = phoneController.text;

          int currentIndex = containers.length - 1;

          containers.add(ContainerStyle(
            name: name,
            phone: phone,
            remove: () => removeItem(currentIndex),
          ));
          counter++;
          textController.clear();
          phoneController.clear();
        }
      });
    }
  }

  void removeItem(int index) {
    setState(() {
      containers.removeAt(index);
      counter--;
    });
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
                errorText: errorMessage.isNotEmpty ? errorMessage : null,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.edit),
                suffixIconColor: Color(0xff2195F1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onChanged: (text) {
                setState(() {
                  errorMessage = '';
                });
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Enter Your Phone Here',
                errorText: errorMessage.isNotEmpty ? errorMessage : null,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.phone),
                suffixIconColor: Color(0xff2195F1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onChanged: (text) {
                setState(() {
                  errorMessage = '';
                });
              },
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
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
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 3),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: List.generate(containers.length, (index) {
                return Column(
                  children: [
                    ContainerStyle(
                      name: containers[index].name,
                      phone: containers[index].phone,
                      remove: () => removeItem(index),
                    ),
                    SizedBox(height: 20),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
