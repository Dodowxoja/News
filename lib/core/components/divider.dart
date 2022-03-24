import 'package:flutter/material.dart';

class Dividers {
  static SizedBox divider() {
    return const SizedBox(
      width: 96,
      child: Divider(
        thickness: 1,
        color: Colors.black,
      ),
    );
  }
}
