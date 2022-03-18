import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc/screens/themes/styles.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.defaultDialog(
          title: "Atenção",
          content: const Text(
            "Deseja sair do App?",
            style: TextStyle(fontSize: 12),
          ),
          onCancel: () {},
          textCancel: "Não",
          onConfirm: () {
            // Get.offAll(const LoginScreen());
          },
          textConfirm: "Sim",
          confirmTextColor: Colors.white,
        );
        return true;
      },
      child: const Scaffold(
        backgroundColor: AppColors.primary,
        body: Text('asdasda'),
      ),
    );
  }
}
