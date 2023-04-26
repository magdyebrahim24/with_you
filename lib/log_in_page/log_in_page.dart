import 'package:flutter/material.dart';
import 'package:with_me/common/custom_widgets/custom_button.dart';
import 'package:with_me/common/custom_widgets/text_form_field.dart';
import 'package:with_me/common/domain/use_cases/set_login_usecase.dart';
import 'package:with_me/common/utils/app_style/app_colors/app_colors.dart';
import 'package:with_me/host_page.dart';
import 'package:with_me/register_page/check_register_type_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final SetLogInUseCase _setLogInUseCase = SetLogInUseCase();

  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
      ),
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
                    'Welcome back! Glad\nto see you again!',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
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
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      alignment: Alignment.centerRight,
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 40,
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
                  const SizedBox(
                    height: 40,
                  ),
                  CustomButton(
                    onPressed: _onLogIn,
                    text: "Log In",
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
                        onTap: () => _navigateToRegisterPage(),
                        child: const Text(
                          "Register Now",
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

  void _onLogIn() async {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HostPage(),
          ));
      await _setLogInUseCase(true);
    }
  }

  void _navigateToRegisterPage() => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterTypePage(),
      ));
}
