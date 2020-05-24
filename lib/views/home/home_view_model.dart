import 'package:flutter/material.dart';
import 'package:scheduleapp/core/base/base_view_model.dart';
import 'package:scheduleapp/core/dto/motd.dart';
import 'package:scheduleapp/core/dto/user.dart';
import 'package:scheduleapp/core/dto/week_schedule.dart';
import 'package:scheduleapp/core/locator.dart';
import 'package:scheduleapp/core/services/api_service.dart';
import 'package:scheduleapp/core/services/navigator_service.dart';
import 'package:scheduleapp/views/sign_in/sign_in_view.dart';
import 'package:scheduleapp/widgets/schedule_divider.dart';
import 'package:scheduleapp/widgets/schedule_item.dart';

class HomeViewModel extends BaseViewModel {
  List<MotdDTO> motds = [];
  DateTime selectedDay = DateTime.now();
  UserDTO user;
  List<Widget> schedule = [];

  ApiService _api = locator<ApiService>();
  NavigatorService _navigator = locator<NavigatorService>();

  HomeViewModel();

  Future init() async {
    user = _api.currentUser;
    notifyListeners();
  }

  Future<void> loadEvents() async {
    log.d("loading MOTD");
    motds = await _api.getMOTD();

    schedule = await selectedDaySchedule();

    notifyListeners();
  }

  Future<void> onDateSelected(DateTime selected) async {
    selectedDay = selected;
    schedule = await selectedDaySchedule();

    notifyListeners();
  }

  Future<void> logout() async {
    await _api.signOut();
    await _navigator.navigateToPageWithReplacement(MaterialPageRoute(builder: (context) => new SignInView()));
  }

  Future<List<Widget>> selectedDaySchedule() async {
    return (await _api.getSchedule(user.group, selectedDay)).map((el) {
      if (el.type == "lection")
        return ScheduleItem(el);
      if (el.type == "break")
        return ScheduleDivider(el);
    }).toList();
  }
}
