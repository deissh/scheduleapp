library home_view;

import 'package:flutter/cupertino.dart';
import 'package:scheduleapp/core/locator.dart';
import 'package:scheduleapp/core/services/navigator_service.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/widgets/app_bar.dart';
import 'package:scheduleapp/widgets/title_text.dart';
import 'home_view_model.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/title_text.dart';

part 'home_mobile.dart';
part 'home_tablet.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeViewModel viewModel = HomeViewModel();
    return ViewModelProvider<HomeViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _HomeMobile(viewModel),
          tablet: _HomeTablet(viewModel),  
        );
      }
    );
  }
}