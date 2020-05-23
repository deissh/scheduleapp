import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scheduleapp/core/base/base_view_model.dart';
import 'package:scheduleapp/core/dto/user.dart';
import 'package:scheduleapp/core/locator.dart';
import 'package:scheduleapp/core/services/api_service.dart';
import 'package:scheduleapp/core/services/navigator_service.dart';
import 'package:scheduleapp/views/tabs/tabs_view.dart';

class SettingsViewModel extends BaseViewModel {
  final ApiService _api = locator<ApiService>();
  final NavigatorService _navigator = locator<NavigatorService>();
  final formKey = GlobalKey<FormState>();

  UserDTO user;

  SettingsViewModel() {
    user = _api.currentUser;
  }

  Future<void> save() async {
    // todo: show error
    if (formKey.currentState.validate() != true) return;

    formKey.currentState.save();

    try {
      await _api.updateUser(user);
      _navigator.navigateToPageWithReplacement(
        MaterialPageRoute(builder: (context) => new TabsView())
      );
    } catch (e) {
      log.e(e.toString());
    }
  }
}
