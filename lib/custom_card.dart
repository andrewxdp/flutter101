import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  const CustomCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(10)),
      child: Text(text, style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}
