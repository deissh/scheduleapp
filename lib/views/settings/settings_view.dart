library settings_view;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/core/dto/user.dart';
import 'settings_view_model.dart';

part 'settings_mobile.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SettingsViewModel viewModel = SettingsViewModel();
    return ViewModelProvider<SettingsViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _SettingsMobile(viewModel),
        );
      }
    );
  }
}
