import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduleapp/views/greeting/greeting_view.dart';

import 'core/locator.dart';
import 'core/providers.dart';
import 'core/services/navigator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firestore.instance.settings(persistenceEnabled: true);
  await LocatorInjector.setupLocator();

  runApp(new MainApplication());
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
          home: new GreetingView()
        ),
        onWillPop: () {
          _nav.pop();
        }
      )
    );
  }
}
