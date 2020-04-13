import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scheduleapp/core/base/base_view_model.dart';

class TabsViewModel extends BaseViewModel {
  List<dynamic> tabs = [
    Icons.apps,
    Icons.calendar_today,
    Icons.notifications,
    Icons.message,
  ];

  TabsViewModel();

  List<Widget> getTabs() {
    return tabs.map(
      (v) => Tab(icon: new Icon(v))
    ).toList();
  }
}
