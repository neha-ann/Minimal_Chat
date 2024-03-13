import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String text;
  final void Function()? onTap;

  const MyButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  State<MyButton> createState() => _MyButtonState();
}

void navigateToPage(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: ElevatedButton(
        onPressed: () {
          if (widget.onTap != null) {
            widget.onTap!(); // Invoke onTap callback if it's not null
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        child: Text(
          widget.text,
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
      ),
    );
  }
}
