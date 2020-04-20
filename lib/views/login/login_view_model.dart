import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/core/base/base_view_model.dart';
import 'package:scheduleapp/core/locator.dart';
import 'package:scheduleapp/core/services/navigator_service.dart';
import 'package:scheduleapp/views/greeting/greeting_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel extends BaseViewModel {
  NavigatorService _navigator = locator<NavigatorService>();

  TextEditingController fnc = TextEditingController();
  TextEditingController snc = TextEditingController();


  int _currentStep = 0;

  get currentStep => _currentStep;
  set currentStep(int value) {
    _currentStep = value;

    if (_currentStep == 4) login();

    notifyListeners();
  }

  LoginViewModel();

  Future<void> login() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool("logined", true);
    prefs.setString("current_user_first_name", fnc.text.trim());
    prefs.setString("current_user_second_name", snc.text.trim());

    await _navigator.navigateToPageWithReplacement(MaterialPageRoute(builder: (_) => new GreetingView()));
  }
}
