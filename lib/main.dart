import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduleapp/views/greeting/greeting_view.dart';
import 'package:scheduleapp/views/sign_in/sign_in_view.dart';

import 'core/locator.dart';
import 'core/providers.dart';
import 'core/services/navigator_service.dart';

void main() async {
  await LocatorInjector.setupLocator();
  runApp(new MainApplication());
}

class MainApplication extends StatelessWidget {
  Widget _getLoading(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          Spacer(),
          Text(
            "Загрузка пользователя...",
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _getLandingPage() {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _getLoading(context);
        }

        if (snapshot.hasData) {
          return new GreetingView();
          // if (snapshot.data.providerData.length == 1) { // logged in using email and password
          //   return snapshot.data.isEmailVerified
          //       ? MainPage()
          //       : VerifyEmailPage(user: snapshot.data);
          // } else { // logged in using other providers
          //   return MainPage();
          // }
        } else {
          return new SignInView();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var _nav = locator<NavigatorService>();

    return MultiProvider(
      providers: ProviderInjector.providers,
      child: WillPopScope(
        child: MaterialApp(
          navigatorKey: _nav.navigatorKey,
          home: _getLandingPage()
        ),
        onWillPop: () {
          _nav.pop();
        }
      )
    );
  }
}
