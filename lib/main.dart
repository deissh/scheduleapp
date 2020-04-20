import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduleapp/views/greeting/greeting_view.dart';
import 'package:scheduleapp/views/login/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/locator.dart';
import 'core/providers.dart';
import 'core/services/navigator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocatorInjector.setupLocator();
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  // );
  SharedPreferences.getInstance();
  var app = MainApplication();
  await app.init();

  runApp(app);
}

class MainApplication extends StatelessWidget {
  SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    var _nav = locator<NavigatorService>();

    return MultiProvider(
      providers: ProviderInjector.providers,
      child: WillPopScope(
        child: MaterialApp(
          navigatorKey: _nav.navigatorKey,
          home:  prefs.getBool("logined") == true ? new GreetingView() : new LoginView(),
        ),
        onWillPop: () {
          _nav.pop();
        }
      )
    );
  }
}
