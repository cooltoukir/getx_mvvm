import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_prefrence_view_model.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.getUser().then((value) {
      if (kDebugMode) {
        print(value.token);
        print(value.isLogin);
      }
      if (value.isLogin == false || value.isLogin.toString() == 'null') {
        Timer(
            const Duration(seconds: 3), () => Get.offAllNamed(RouteName.loginView));
      } else {
        Timer(
            const Duration(seconds: 3), () => Get.offAllNamed(RouteName.homeView));
      }
    });
  }
}
