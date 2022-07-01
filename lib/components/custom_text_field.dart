import 'package:flutter/material.dart';
import 'package:fuel_token_app/components/utills.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Icon icon;
  final bool isObscure;
  final int length;
  final TextInputType type;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.icon,
    required this.controller,
    this.length = 15,
    this.type = TextInputType.name,
    this.isObscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: TextFormField(
            // maxLength: length,
            keyboardType: type,
            controller: controller, obscureText: isObscure,
            decoration: InputDecoration(
                prefixIcon: icon,
                prefixIconColor: kred2color,
                label: Text(label),
                border: InputBorder.none,
                labelStyle: const TextStyle(color: kred2color)),
          ),
        ));
  }
}
