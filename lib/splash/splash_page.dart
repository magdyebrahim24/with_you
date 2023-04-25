import 'dart:async';
import 'package:flutter/material.dart';
import 'package:with_me/common/utils/app_images_paths/app_images_paths.dart';
import 'package:with_me/common/utils/app_style/app_colors/app_colors.dart';
import 'package:with_me/log_in_page/log_in_page.dart';
import 'package:with_me/walk_throw/walk_throw_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;
  static const int _splashDurationInSec = 3;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: _splashDurationInSec),
        () => _navigateToHomePage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(child: Image.asset(AppImagesPaths.splashLogo,scale: 1.2,isAntiAlias: true,)),
    );
  }

  void _navigateToHomePage() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const WalkThrowPage(),
    ));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
