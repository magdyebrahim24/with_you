import 'package:flutter/material.dart';
import 'package:with_me/common/custom_widgets/custom_button.dart';
import 'package:with_me/common/utils/app_style/app_colors/app_colors.dart';

import '../common/custom_widgets/custom_appbar.dart';

class RegisterTypePage extends StatelessWidget {
  const RegisterTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                const Text(
                  "Register as",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
                ),
                CustomButton(onPressed: () {}, text: "Tour Guide"),
                CustomButton(onPressed: () {}, text: "Photographer"),
                CustomButton(onPressed: () {}, text: "Tourist"),
              ]),
        ),
      ),
    );
  }
}
