import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const UserTile({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 221, 221, 221),
            borderRadius: BorderRadius.circular(7),
          ),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          padding: EdgeInsets.all(17),
          child: Row(children: [
            //icon
            const Icon(Icons.person),
            SizedBox(width: 20),
            //text
            Text(text),
          ])),
    );
  }
}
