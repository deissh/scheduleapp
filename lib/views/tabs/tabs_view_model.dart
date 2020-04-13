import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scheduleapp/core/base/base_view_model.dart';

class TabsViewModel extends BaseViewModel {
  List<dynamic> _tabs = [
    Icons.home,
    Icons.rss_feed,
    Icons.perm_identity,
  ];

  TabsViewModel();

  List<Widget> getTabs() {
    return _tabs.map(
      (v) => Tab(icon: new Icon(v))
    ).toList();
  }
}
