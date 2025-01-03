import 'package:flutter/material.dart';

class ClassActionBtn extends StatelessWidget {
  const ClassActionBtn({
    super.key,
    required this.PageTitle,
  });

  final String PageTitle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: const BorderSide(color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 44.0)),
      child: Text(
        PageTitle,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
    );
  }
}
