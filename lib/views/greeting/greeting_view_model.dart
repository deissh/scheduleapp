import 'package:flutter/material.dart';
import 'package:scheduleapp/core/base/base_view_model.dart';
import 'package:scheduleapp/core/locator.dart';
import 'package:scheduleapp/core/services/navigator_service.dart';
import 'package:scheduleapp/views/home/home_view.dart';
import 'package:scheduleapp/views/tabs/tabs_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GreetingViewModel extends BaseViewModel {
  String _status = "";
  String _firstName = "";

  NavigatorService _navigator = locator<NavigatorService>();
  GreetingViewModel();

  set status(String value) {
    _status = value;
    notifyListeners();

    log.d("guard status chaged");
  }
  String get status => _status;

  get firstName => _firstName;
  set firstName(value) {
    _firstName = value;
    notifyListeners();
  }

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
    var prefs = await SharedPreferences.getInstance();
    firstName = prefs.getString("current_user_first_name");

    status = "Проверка обновлений";
    await Future.delayed(Duration(seconds: 3));

    status = "Загрузка обновлений";
    await Future.delayed(Duration(seconds: 3));

    status = "Готово";
    await Future.delayed(Duration(seconds: 3));

    status = "";

    await _navigator.navigateToPageWithReplacement(MaterialPageRoute(builder: (context) => new TabsView()));
  }
}
