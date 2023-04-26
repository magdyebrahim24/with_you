import 'package:flutter/material.dart';
import 'package:with_me/common/custom_widgets/custom_button.dart';
import 'package:with_me/common/custom_widgets/text_form_field.dart';
import 'package:with_me/common/utils/app_style/app_colors/app_colors.dart';
import 'package:with_me/filter/models/user_type.dart';
import 'complete_register_page.dart';

class RegisterPage extends StatefulWidget {
  final UserType userType;
  const RegisterPage({Key? key, required this.userType}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String? _userName;
  String? _email;
  String? _password;
  String? _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackgroundColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Hello Register To Get Started',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  AppTextFormFiled(
                    hintText: "Enter Your User Name",
                    labelText: "User Name",
                    textInputType: TextInputType.text,
                    onChanged: (text) {
                      _userName = text;
                      setState(() {});
                    },
                  ),
                  AppTextFormFiled(
                    hintText: "Enter Your Email",
                    labelText: "Email",
                    textInputType: TextInputType.emailAddress,
                    onChanged: (email) {
                      _email = email;
                      setState(() {});
                    },
                  ),
                  AppTextFormFiled(
                    hintText: "Enter Your Password",
                    labelText: "Password",
                    isSecure: true,
                    onChanged: (pass) {
                      _password = pass;
                      setState(() {});
                    },
                  ),
                  AppTextFormFiled(
                    hintText: "Confirm Your Password",
                    labelText: "Confirm Password",
                    isSecure: true,
                    onChanged: (pass) {
                      _confirmPassword = pass;
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    onPressed: () => _onTapNext(widget.userType),
                    text: "Next",
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't Have an Account?"),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Text(
                          "LogIn Now",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNext(UserType userType) {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>  CompleteRegisterPage(userType: userType),
      ));
    }
  }
}
