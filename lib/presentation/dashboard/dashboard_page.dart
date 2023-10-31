// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_fic9_ecommerce_app_fajar/presentation/account/account_page.dart';
import 'package:flutter_fic9_ecommerce_app_fajar/presentation/home/home_page.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/images.dart';

class dashboardPage extends StatefulWidget {
  const dashboardPage({super.key});

  @override
  State<dashboardPage> createState() => _dashboardPageState();
}

class _dashboardPageState extends State<dashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const Center(
      child: Text('Explore Page'),
    ),
    const Center(child: Text('Cart Page')),
    const AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: ColorName.primary,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.iconHome)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.iconSearch)),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.iconCart)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Images.iconUser)),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
