library notifications_view;

import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'notifications_view_model.dart';

part 'notifications_mobile.dart';

class NotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NotificationsViewModel viewModel = NotificationsViewModel();
    return ViewModelProvider<NotificationsViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _NotificationsMobile(viewModel),
        );
      }
    );
  }
}
