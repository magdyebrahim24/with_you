import 'package:flutter/material.dart';
import 'package:with_me/common/custom_widgets/custom_button.dart';
import 'package:with_me/common/utils/app_style/app_colors/app_colors.dart';
import 'package:with_me/filter/models/user_type.dart';
import 'package:with_me/register_page/register_page.dart';


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
          child: Column(children: [
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
            CustomButton(
                onPressed: () => _navigateToRegisterPage(context,UserType.Tour_Guide),
                text: "Tour Guide"),
            CustomButton(
                onPressed: () => _navigateToRegisterPage(context,UserType.Photographer),
                text: "Photographer"),
            CustomButton(
                onPressed: () => _navigateToRegisterPage(context,UserType.Tourist),
                text: "Tourist"),
          ]),
        ),
      ),
    );
  }

  void _navigateToRegisterPage(context,UserType userType) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>  RegisterPage(userType: userType),
    ));
  }
}
