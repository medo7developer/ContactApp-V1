import 'package:flutter/material.dart';

class ContainerStyle extends StatelessWidget {
  final String name;
  final String phone;

  ContainerStyle({required this.name, required this.phone, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
