import 'package:flutter/material.dart';
import 'package:scheduleapp/core/base/base_view_model.dart';
import 'package:scheduleapp/core/dto/user.dart';
import 'package:scheduleapp/core/locator.dart';
import 'package:scheduleapp/core/services/api_service.dart';
import 'package:scheduleapp/core/services/navigator_service.dart';
import 'package:scheduleapp/views/settings/settings_view.dart';

class ProfileViewModel extends BaseViewModel {
  ApiService _api = locator<ApiService>();
  NavigatorService _navigator = locator<NavigatorService>();

  UserDTO user;

  ProfileViewModel() {
    user = _api.currentUser;
  }

  Future<void> logout() async {
    await _api.signOut();
  }

  Future<void> settings() async {
    await _navigator.navigateToPage(MaterialPageRoute(builder: (context) => new SettingsView()));
  }
}
