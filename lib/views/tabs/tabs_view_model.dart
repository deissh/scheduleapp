import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scheduleapp/core/base/base_view_model.dart';

class TabsViewModel extends BaseViewModel {
  List<dynamic> tabs = [
    Icons.apps,
    Icons.school,
    Icons.portrait
    // Icons.notifications,
    // Icons.portrait,
  ];

  TabsViewModel();

  List<Widget> getTabs() {
    return tabs.map(
      (v) => Tab(icon: new Icon(v))
    ).toList();
  }
}
