import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/core/base/base_view_model.dart';
import 'package:scheduleapp/core/locator.dart';
import 'package:scheduleapp/core/services/api_service.dart';
import 'package:scheduleapp/core/services/navigator_service.dart';
import 'package:scheduleapp/views/greeting/greeting_view.dart';

class LoginViewModel extends BaseViewModel {
  NavigatorService _navigator = locator<NavigatorService>();
  ApiService _api = locator<ApiService>();

  TextEditingController loginController = TextEditingController();
  TextEditingController passController = TextEditingController();

  LoginViewModel();

  Future<void> login(BuildContext context) async {
    try {
      await _api.login(loginController.value.text, passController.value.text);
    } on DioError catch(e) {
      print(e.response);

      return showDialog(
        context: context,
        builder: (BuildContext context){
            return AlertDialog(
              title: Text("Ошибка авторизации"),
              content: Text(e.response.data.toString()),
            );
        }
      );
    }

    await _navigator.navigateToPageWithReplacement(MaterialPageRoute(builder: (_) => new GreetingView()));
  }
}
