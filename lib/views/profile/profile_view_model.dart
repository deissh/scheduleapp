import 'package:scheduleapp/core/base/base_view_model.dart';
import 'package:scheduleapp/core/dto/user.dart';
import 'package:scheduleapp/core/locator.dart';
import 'package:scheduleapp/core/services/api_service.dart';

class ProfileViewModel extends BaseViewModel {
  ApiService _api = locator<ApiService>();

  UserDTO user;

  ProfileViewModel() {
    user = _api.currentUser;
  }

  Future<void> logout() async {
    await _api.signOut();
  }
}
