import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/core/base/base_view_model.dart';
import 'package:scheduleapp/core/dto/user.dart';
import 'package:scheduleapp/core/locator.dart';
import 'package:scheduleapp/core/services/api_service.dart';
import 'package:scheduleapp/core/services/navigator_service.dart';
import 'package:scheduleapp/views/home/home_view.dart';
import 'package:scheduleapp/views/sign_in/sign_in_view.dart';
import 'package:scheduleapp/views/tabs/tabs_view.dart';

class GreetingViewModel extends BaseViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final NavigatorService _navigator = locator<NavigatorService>();
  final ApiService _api = locator<ApiService>();

  String _status = "";
  UserDTO _user;

  GreetingViewModel();

  set status(String value) {
    _status = value;
    notifyListeners();
  }
  String get status => _status;

  set user(UserDTO value) {
    _user = value;
    notifyListeners();
  }
  UserDTO get user => _user;

  String get gretting {
    var hour = new DateTime.now().hour;

    if (hour < 10)
      return "С добрым утром,";
    else if(hour < 16)
      return "Добрый день,";
    else if(hour < 22)
      return "Добрый вечер,";
    else
      return "Добной ночи,";
  }

  Future<void> checkUpdates() async {
    status = "Загрузка профиля";
    _auth.onAuthStateChanged.listen((firebaseUser) async {
      if (firebaseUser == null) {
        return _navigator.navigateToPageWithReplacement(
          MaterialPageRoute(builder: (context) => new SignInView())
        );
      }

      user = await _api.populateCurrentUser(firebaseUser);

      status = "Проверка обновлений";
      await Future.delayed(Duration(seconds: 3));

      status = "";
      await Future.delayed(Duration(seconds: 3));

      _navigator.navigateToPageWithReplacement(
        MaterialPageRoute(builder: (context) => new HomeView())
      );
    });
  }
}
