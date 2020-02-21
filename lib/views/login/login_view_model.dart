import 'package:flutter/material.dart';
import 'package:scheduleapp/core/base/base_view_model.dart';
import 'package:scheduleapp/core/locator.dart';
import 'package:scheduleapp/core/services/navigator_service.dart';
import 'package:scheduleapp/views/greeting/greeting_view.dart';

class LoginViewModel extends BaseViewModel {
  NavigatorService _navigator = locator<NavigatorService>();
  LoginViewModel();

  Future<void> login() async {
    await Future.delayed(Duration(seconds: 1));

    await _navigator.navigateToPageWithReplacement(MaterialPageRoute(builder: (_) => new GreetingView()));
  }
}
