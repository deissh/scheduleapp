import 'package:flutter/material.dart';
import 'package:scheduleapp/core/base/base_view_model.dart';
import 'package:scheduleapp/core/dto/motd.dart';
import 'package:scheduleapp/core/dto/user.dart';
import 'package:scheduleapp/core/dto/week_schedule.dart';
import 'package:scheduleapp/core/locator.dart';
import 'package:scheduleapp/core/services/api_service.dart';
import 'package:scheduleapp/core/services/navigator_service.dart';
import 'package:scheduleapp/views/sign_in/sign_in_view.dart';

class HomeViewModel extends BaseViewModel {
  List<MotdDTO> motds = [];
  WeekScheduleDto week;
  DateTime _selectedDay = DateTime.now();
  UserDTO user;

  ApiService _api = locator<ApiService>();
  NavigatorService _navigator = locator<NavigatorService>();

  HomeViewModel();

  Future init() async {
    user = _api.currentUser;
    notifyListeners();
  }

  DateTime get selectedDay => _selectedDay;
  set selectedDay (DateTime date) {
    _selectedDay = date;
    notifyListeners();
  }

  Future<void> loadEvents() async {
    log.d("loading MOTD");
    motds = await _api.getMOTD();
    notifyListeners();
  }

  Future<void> onDateSelected(DateTime selected) async {
    selectedDay = selected;
  }

  Future<void> logout() async {
    await _api.signOut();
    await _navigator.navigateToPageWithReplacement(MaterialPageRoute(builder: (context) => new SignInView()));
  }
}
