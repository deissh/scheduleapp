import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/locator.dart';
import 'core/providers.dart';
import 'core/services/navigator_service.dart';
import 'views/home/home_view.dart';

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
    return MultiProvider(
      providers: ProviderInjector.providers,
      child: WillPopScope(
        child: MaterialApp(
          navigatorKey: locator<NavigatorService>().navigatorKey,
          home: HomeView(),
        ),
        onWillPop: () async {
          locator<NavigatorService>().pop();
        }
      )
    );
  }
}