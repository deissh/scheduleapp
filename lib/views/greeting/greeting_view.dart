library greeting_view;

import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/widgets/delayed_animation.dart';
import 'greeting_view_model.dart';

part 'greeting_mobile.dart';
part 'greeting_tablet.dart';

class GreetingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GreetingViewModel viewModel = GreetingViewModel();
    return ViewModelProvider<GreetingViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) async {
        await viewModel.checkUpdates();
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _GreetingMobile(viewModel),
          tablet: _GreetingTablet(viewModel),
        );
      }
    );
  }
}
