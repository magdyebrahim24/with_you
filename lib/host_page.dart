import 'package:flutter/material.dart';
import 'package:with_me/common/utils/app_style/app_colors/app_colors.dart';
import 'package:with_me/home_page/ui/home_page.dart';
import 'package:with_me/messages_page/messages_page.dart';

import 'profile_page/profile_page.dart';

class HostPage extends StatefulWidget {
  const HostPage({Key? key}) : super(key: key);

  @override
  State<HostPage> createState() => _HostPageState();
}

class _HostPageState extends State<HostPage> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = const [HomePage(),MessagesPage(),ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(color: AppColors.backgroundColor),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_cal_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
