// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_fic9_ecommerce_app_fajar/data/datasources/auth_local_datasource.dart';
import 'package:flutter_fic9_ecommerce_app_fajar/presentation/auth/login_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await AuthLocalDatasource().removeAuthData();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const loginPage();
            }));
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
