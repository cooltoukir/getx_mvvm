import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/assets/image_assets.dart';
import 'package:getx_mvvm/res/components/general_exceptions_widget.dart';
import 'package:getx_mvvm/res/components/round_button.dart';

import '../res/components/internet_exceptions_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('email_hint'.tr),
      ),
      body: Column(
        children: [
          RoundButton(title: "Login", onPress: () {}, width: 200,)
        ],
      ),
    );
  }
}
