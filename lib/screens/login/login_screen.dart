import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tcc/screens/background.dart';
import 'package:tcc/screens/login/components/auth_form.dart';
import 'package:tcc/screens/themes/styles.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.primary,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                  transform: Matrix4.rotationZ(-8 * pi / 180),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.deepOrange,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.black,
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Text('Minha Loja'),
                ),
                AuthForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
