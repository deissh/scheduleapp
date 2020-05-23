import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scheduleapp/core/base/base_service.dart';
import 'package:scheduleapp/core/dto/motd.dart';
import 'package:scheduleapp/core/dto/user.dart';

class ApiService extends BaseService {
  final CollectionReference _usersCollectionReference = Firestore.instance.collection("users");
  final CollectionReference _motdCollectionReference = Firestore.instance.collection("motd");

  UserDTO _currentUser;
  UserDTO get currentUser => _currentUser;

  ApiService();

  Future<UserDTO> populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await getUser(user.uid);
    }

    return _currentUser;
  }


  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
    _currentUser = null;
  }

  Future<void> setUser(UserDTO user) async {
    await _usersCollectionReference.document(user.id).setData(user.toJson());
  }

  Future<UserDTO> getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      return UserDTO.fromJson(userData.data);
    } catch (e) {
      log.e(e.toString());
      return null;
    }
  }

  Future<List<MotdDTO>> getMOTD() async {
    try {
      var data = await _motdCollectionReference.getDocuments();
      return data.documents
        .map((r) => MotdDTO.fromMap(r.data))
        .toList();
    } catch (e) {
      log.e(e.toString());
      return null;
    }
  }

  Future<UserDTO> updateUser(UserDTO user) async {
    var fa = await FirebaseAuth.instance.currentUser();

    if (fa.displayName != user.displayName || fa.photoUrl != user.avatarUrl) {
      var update = UserUpdateInfo();

      update.displayName = user.displayName;
      update.photoUrl = user.avatarUrl;

      await fa.updateProfile(update);
    }

    if (fa.email != user.email)
      await fa.updateEmail(user.email);

    await setUser(user);
    _currentUser = user;

    return user;
  }
}
