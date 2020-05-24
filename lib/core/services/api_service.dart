import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scheduleapp/core/base/base_service.dart';
import 'package:scheduleapp/core/dto/motd.dart';
import 'package:scheduleapp/core/dto/user.dart';
import 'package:scheduleapp/core/dto/week_schedule.dart';

class ApiService extends BaseService {
  final CollectionReference _usersCollectionReference = Firestore.instance.collection("users");
  final CollectionReference _motdCollectionReference = Firestore.instance.collection("motd");
  final CollectionReference _scheduleCollectionReference = Firestore.instance.collection("schedule");

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
        .where((r) => DateTime.now().subtract(Duration(days: 3)).isBefore(r.createdAt))
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

  Future<List<Schedule>> getSchedule(String group, DateTime day) async {
    var data = _scheduleCollectionReference.document(group);

    // четная|не четная неделя - день недели
    // warning: In accordance with ISO 8601 a week starts with Monday, which has the value 1.
    var week = await data.collection('0_${day.weekday - 1}').getDocuments();

    return week.documents
      .map((e) => Schedule.fromMap(e.data))
      .toList();
  }
}
