import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:scheduleapp/core/base/base_view_model.dart';
import 'package:scheduleapp/core/locator.dart';
import 'package:scheduleapp/core/services/navigator_service.dart';
import 'package:scheduleapp/views/home/home_view.dart';

class GuardViewModel extends BaseViewModel {
  String _status = "";

  NavigatorService _navigator = locator<NavigatorService>();
  GuardViewModel();
  
  set status(String value) {
    _status = value;
    notifyListeners();

    log.log(Level.info, "guard status chaged");
  }
  String get status => _status;

  String get gretting {
    var hour = new DateTime.now().hour;

    var afternoon = 12;
	  var evening = 17;

    if(hour >= afternoon && hour <= evening)
      return "Добной ночи,";
    else if(hour >= evening)
      return "Добрый вечер,";
    else
      return "С добрым утром,";
  }

  Future<void> checkCredentinals() async {
    status = "Проверка аккаунта";
    await Future.delayed(Duration(seconds: 3));

    status = "Проверка обновлений";
    await Future.delayed(Duration(seconds: 3));

    status = "Загрузка обновлений";
    await Future.delayed(Duration(seconds: 3));

    status = "Готово";
    await Future.delayed(Duration(seconds: 3));

    status = "";

    await _navigator.navigateToPage(MaterialPageRoute(builder: (context) => new HomeView()));
  }
}