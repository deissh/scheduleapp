import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduleapp/views/greeting/greeting_view.dart';

import 'core/locator.dart';
import 'core/providers.dart';
import 'core/services/navigator_service.dart';

void main() async {
  await LocatorInjector.setupLocator();
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  // );

  runApp(MainApplication());
}

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _nav = locator<NavigatorService>();

    return MultiProvider(
      providers: ProviderInjector.providers,
      child: WillPopScope(
        child: MaterialApp(
          navigatorKey: _nav.navigatorKey,
          home: _nav.guard(new GreetingView()),
        ),
        onWillPop: () async {
          _nav.pop();
        }
      )
    );
  }
}
