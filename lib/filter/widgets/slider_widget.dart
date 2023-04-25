
import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final double sliderValue;
  final void Function(double)? onChanged;
  const SliderWidget({Key? key, required this.sliderValue, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Price Range",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          Theme(
            data: ThemeData(
                sliderTheme: const SliderThemeData(
                  showValueIndicator: ShowValueIndicator.always,
                )),
            child: Slider(
              value: sliderValue,
              activeColor: Colors.white,
              inactiveColor: Colors.white12,
              min: 0,
              max: 10000,
              label: sliderValue.round().toString(),
              onChanged: onChanged

            ),
          ),
        ],
      ),
    );
  }
}
