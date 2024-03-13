import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  const MyTextField({
    Key? key,
    required this.hintText,
    required this.obscureText,
    this.controller,
    this.focusNode,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyCustomTextFieldState();
}

class _MyCustomTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 207, 207, 207),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 207, 207, 207),
          ),
        ),
        hintText: widget.hintText,
      ),
      controller: widget.controller, // Pass the controller here
    );
  }
}
