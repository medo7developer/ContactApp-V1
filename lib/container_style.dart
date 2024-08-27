import 'package:flutter/material.dart';

class ContainerStyle extends StatelessWidget {
  final VoidCallback remove;
  final String name;
  final String phone;

  ContainerStyle(
      {required this.name,
      required this.phone,
      required this.remove,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(22),
          width: MediaQuery.of(context).size.width * 7,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(45),
          ),
          child: Text(
            'Name: $name\nPhone: $phone',
            style: TextStyle(fontSize: 22),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .11,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: remove,
                child: Icon(
                  Icons.delete,
                  size: 30,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
