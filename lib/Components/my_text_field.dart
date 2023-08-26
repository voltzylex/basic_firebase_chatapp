import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.textEditingController,
      required this.hintText,
      this.obscureText = false});
  final TextEditingController textEditingController;
  final String hintText;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: textEditingController,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.grey.shade200),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            filled: true,
            fillColor: Colors.grey.shade100,
            hintText: hintText,
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 119, 119, 119))),
        cursorColor: Colors.white,
        style: const TextStyle(
          color: Color.fromARGB(255, 133, 131, 131),
        ),
      ),
    );
  }
}
