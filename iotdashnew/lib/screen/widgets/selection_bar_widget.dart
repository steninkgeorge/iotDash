import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';

class selectionbar extends StatelessWidget {
  final String text;
  final Function oncallback;
  const selectionbar({super.key, required this.text, required this.oncallback});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: () {
        oncallback();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: MediaQuery.of(context).size.width / 2,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
