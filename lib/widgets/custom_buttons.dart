import 'package:flutter/material.dart';

class CustomButtons extends StatefulWidget {
  const CustomButtons(
      {Key? key,
      required this.onPress,
      required this.backgroundColor,
      required this.borderColor,
      required this.borderWidth,
      required this.icon,
      required this.label})
      : super(key: key);
  final void Function() onPress;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final IconData? icon;
  final String label;

  @override
  State<CustomButtons> createState() => _CustomButtonsState();
}

class _CustomButtonsState extends State<CustomButtons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 6.0,
        ),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: widget.borderColor,
            width: widget.borderWidth,
          ),
        ),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: Colors.white,
            ),
            const SizedBox(width: 8.0),
            Text(
              widget.label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
