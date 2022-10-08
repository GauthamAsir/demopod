import 'package:demopod_flutter/screens/auth/login.dart';
import 'package:demopod_flutter/screens/auth/signup.dart';
import 'package:demopod_flutter/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ServerPod Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: LoginPage.routeName, page: () => const LoginPage()),
        GetPage(name: SignUpPage.routeName, page: () => const SignUpPage()),
        GetPage(name: HomePage.routeName, page: () => const HomePage()),
      ],
      home: const LoginPage(),
    );
  }
}
