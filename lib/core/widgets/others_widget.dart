import 'package:flutter/material.dart';

class OthersWidget {
  static SizedBox others(IconData icon, String text, {String numbers = ''}) {
    return SizedBox(
      child: Row(
        children: [
          Icon(icon, size: 20),
          Text(numbers),
          Text(text),
        ],
      ),
    );
  }
}
