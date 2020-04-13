library tabs_view;

import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/views/home/home_view.dart';
import 'tabs_view_model.dart';

part 'tabs_mobile.dart';

class TabsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TabsViewModel viewModel = TabsViewModel();
    return ViewModelProvider<TabsViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _TabsMobile(viewModel),
        );
      }
    );
  }
}
