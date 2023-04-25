import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:with_me/filter/filter_page.dart';
import 'package:with_me/host_page.dart';
import 'package:with_me/log_in_page/log_in_page.dart';
import 'package:with_me/register_page/register_page.dart';
import 'package:with_me/splash/splash_page.dart';

import 'home_page/ui/home_page.dart';

class TheApp extends StatelessWidget {
  const TheApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: RegisterPage());
  }
}
