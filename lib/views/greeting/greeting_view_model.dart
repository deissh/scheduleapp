import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/core/base/base_view_model.dart';
import 'package:scheduleapp/core/locator.dart';
import 'package:scheduleapp/core/services/navigator_service.dart';
import 'package:scheduleapp/views/tabs/tabs_view.dart';

class GreetingViewModel extends BaseViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final NavigatorService _navigator = locator<NavigatorService>();

  String _status = "";
  String _firstName = "";

  GreetingViewModel();

  Future init() async {
    var user = await _auth.currentUser();

    _firstName = user.displayName;
  }

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
