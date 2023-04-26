import 'package:flutter/material.dart';
import 'package:with_me/common/domain/use_cases/set_login_usecase.dart';
import 'package:with_me/welcome_page/welcome_page.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final SetLogInUseCase _setLogInUseCase = SetLogInUseCase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), actions: [
        IconButton(
            onPressed: () async {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const WelcomePage(),
              ));
              await _setLogInUseCase(false);
            },
            icon: const Icon(Icons.logout))
      ]),
    );
  }
}
