// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_fic9_ecommerce_app_fajar/common/constants/images.dart';
import 'package:flutter_fic9_ecommerce_app_fajar/presentation/auth/login_page.dart';

class splashPage extends StatefulWidget {
  const splashPage({super.key});

  @override
  State<splashPage> createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const loginPage(),
        ),
      ),
    );

    return Scaffold(
      body: Center(
          child: Image.asset(
        Images.logo,
        width: 200,
        height: 200,
      )),
    );
  }
}
