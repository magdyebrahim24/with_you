import 'package:flutter/material.dart';
import 'package:with_me/common/utils/app_images_paths/app_images_paths.dart';
import 'package:with_me/log_in_page/log_in_page.dart';
import 'package:with_me/register_page/check_register_type_page.dart';
import '../common/utils/app_style/app_colors/app_colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImagesPaths.walkThrowBg),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Let\'s Go',
                  style: TextStyle(color: AppColors.forthColor, fontSize: 55),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'WithYou  every where',
                  style: TextStyle(color: AppColors.forthColor, fontSize: 20),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .45,
                ),
                _logInOrRegisterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logInOrRegisterWidget() {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      // padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: InkWell(
              onTap: _onTapLogIn,
              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  color: AppColors.forthColor,
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            )),
            Expanded(
                child: InkWell(
              onTap: _onTapRegister,
              child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  color: AppColors.secondBackgroundColor,
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.forthColor),
                  )),
            )),
          ]),
    );
  }

  void _onTapLogIn() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LogInPage()));
  }

  void _onTapRegister() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const RegisterTypePage()));
  }
}
