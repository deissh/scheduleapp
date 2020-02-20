library guard_view;

import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/widgets/delayed_animation.dart';
import 'guard_view_model.dart';

part 'guard_mobile.dart';
part 'guard_tablet.dart';

class GuardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GuardViewModel viewModel = GuardViewModel();

    return ViewModelProvider<GuardViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) async {
        await viewModel.checkCredentinals();
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _GuardMobile(viewModel),
          tablet: _GuardTablet(viewModel),  
        );
      }
    );
  }
}