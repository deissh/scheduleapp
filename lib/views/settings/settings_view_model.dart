import 'package:flutter/widgets.dart';
import 'package:scheduleapp/core/base/base_view_model.dart';
import 'package:scheduleapp/core/dto/user.dart';
import 'package:scheduleapp/core/locator.dart';
import 'package:scheduleapp/core/services/api_service.dart';

class SettingsViewModel extends BaseViewModel {
  ApiService _api = locator<ApiService>();
  final formKey = GlobalKey<FormState>();

  UserDTO user;

  SettingsViewModel() {
    user = _api.currentUser;
  }

  // Add ViewModel specific code here
}
