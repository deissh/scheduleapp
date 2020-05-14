import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scheduleapp/core/base/base_service.dart';
import 'package:scheduleapp/core/dto/user.dart';

class ApiService extends BaseService {
  final CollectionReference _usersCollectionReference = Firestore.instance.collection("users");

  UserDTO _currentUser;
  UserDTO get currentUser => _currentUser;

  ApiService();

  Future<void> populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await getUser(user.uid);
    }
  }

  Future<void> createUser(UserDTO user) async {
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
}
