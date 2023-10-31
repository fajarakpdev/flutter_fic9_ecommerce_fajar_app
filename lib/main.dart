import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fic9_ecommerce_app_fajar/data/datasources/auth_local_datasource.dart';
import 'package:flutter_fic9_ecommerce_app_fajar/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_fic9_ecommerce_app_fajar/presentation/auth/login_page.dart';
import 'package:flutter_fic9_ecommerce_app_fajar/presentation/cart/bloc/cart/cart_bloc.dart';
import 'package:flutter_fic9_ecommerce_app_fajar/presentation/dashboard/dashboard_page.dart';
import 'package:flutter_fic9_ecommerce_app_fajar/presentation/home/bloc/product/products_bloc.dart';

import 'presentation/auth/bloc/register/register_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) =>
              ProductsBloc()..add(const ProductsEvent.getAll()),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: FutureBuilder(
            future: AuthLocalDatasource().isLogin(),
            builder: (context, snapshot) {
              if (snapshot.data != null && snapshot.data!) {
                return const dashboardPage();
              } else {
                return const loginPage();
              }
            },
          )),
    );
  }
}
