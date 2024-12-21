import 'package:flutter/material.dart';
import 'styles.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color color;
  final double width;

  const CalculatorButton({
    required this.text,
    required this.color,
    this.width = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: (width * 2).toInt(),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle button press here
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            backgroundColor: color,
            padding: const EdgeInsets.all(20.0),
            elevation: 5,
          ),
          child: Text(
            text,
            style: AppStyles.buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
