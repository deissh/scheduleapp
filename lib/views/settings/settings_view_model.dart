import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scheduleapp/core/base/base_view_model.dart';
import 'package:scheduleapp/core/dto/user.dart';
import 'package:scheduleapp/core/locator.dart';
import 'package:scheduleapp/core/services/api_service.dart';
import 'package:scheduleapp/core/services/navigator_service.dart';
import 'package:scheduleapp/views/tabs/tabs_view.dart';
import 'package:uuid/uuid.dart';

class SettingsViewModel extends BaseViewModel {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final ApiService _api = locator<ApiService>();
  final NavigatorService _navigator = locator<NavigatorService>();
  final formKey = GlobalKey<FormState>();

  UserDTO user;

  SettingsViewModel() {
    user = _api.currentUser;
  }

  Future<void> pickAvatar() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    var reference = _storage.ref().child('avatars/').child('avatar_${user.id}_${Uuid().v4().toString()}');
    var uploadTask = reference.putFile(image);

    user.avatarUrl = await (await uploadTask.onComplete).ref.getDownloadURL();

    notifyListeners();
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
