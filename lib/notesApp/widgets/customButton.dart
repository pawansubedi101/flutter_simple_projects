// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onpress,
    required this.labelText,
  }) : super(key: key);

  final String labelText;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: ElevatedButton(
            onPressed: onpress,
            child: Text(
              labelText.toUpperCase(),
              style: const TextStyle(
                fontSize: 16,
              ),
            )));
  }
}
