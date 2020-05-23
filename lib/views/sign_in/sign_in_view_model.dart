import 'package:flutter/material.dart';
import 'package:scheduleapp/core/base/base_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scheduleapp/core/dto/user.dart';
import 'package:scheduleapp/core/locator.dart';
import 'package:scheduleapp/core/services/api_service.dart';
import 'package:scheduleapp/core/services/navigator_service.dart';
import 'package:scheduleapp/views/greeting/greeting_view.dart';


class SignInViewModel extends BaseViewModel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  NavigatorService _navigator = locator<NavigatorService>();
  ApiService _api = locator<ApiService>();

  SignInViewModel();

  Future signIn(BuildContext context, String method) async {
    var user;

    switch (method) {
      case "google":
        user = await signInWithGoogle();
        break;
    }

    var data = await _api.getUser(user.uid);
    if (data == null) {
      try {
        await _api.setUser(new UserDTO(
          id: user.uid,
          displayName: user.displayName,
          email: user.email,
          avatarUrl: user.photoUrl,
          registrationDate: new DateTime.now().toIso8601String(),
          group: "none",
          notifications: Notifications(
            pm: true,
            updates: true,
            mentions: true
          )
        ));

        await _api.populateCurrentUser(user);
      } catch (e) {
        return showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Ошибка при авторизации"),
            content: Text(e.toString()),
          );
        });
      }
    }

    log.i('signInWithGoogle succeeded: $user');
    await _navigator.navigateToPageWithReplacement(MaterialPageRoute(builder: (context) => new GreetingView()));
  }

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return user;
  }
}
