import 'dart:async';
import 'package:flutter/material.dart';
import 'package:with_me/common/domain/use_cases/get_login_status.dart';
import 'package:with_me/common/utils/app_images_paths/app_images_paths.dart';
import 'package:with_me/common/utils/app_style/app_colors/app_colors.dart';
import 'package:with_me/host_page.dart';
import 'package:with_me/welcome_page/welcome_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final GetLogInStatus _getLogInStatus = GetLogInStatus();
  bool isLogIn = false;



  @override
  void initState() {
    _checkIfLogIn();
    Timer(const Duration(seconds: 30),
        () => _navigateToHomePage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
          child: Image.asset(
        AppImagesPaths.splashSecondLogo,
        scale: 1.2,
        isAntiAlias: true,
      )),
    );
  }

  void _navigateToHomePage() {
    if (isLogIn) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HostPage(),
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const  WelcomePage(),
      ));
    }
  }

  Future<void> _checkIfLogIn() async {
    isLogIn = await _getLogInStatus();

  }

}
