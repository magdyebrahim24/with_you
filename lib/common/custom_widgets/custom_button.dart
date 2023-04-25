import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? color;
  const CustomButton(
      {Key? key, required this.onPressed, required this.text, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: MaterialButton(
        onPressed: onPressed,
        color: color ?? Colors.white,
        padding: const EdgeInsets.all(15),
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
      ),
    );
  }
}
