library profile_view;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/core/dto/user.dart';
import 'profile_view_model.dart';

part 'profile_mobile.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProfileViewModel viewModel = ProfileViewModel();
    return ViewModelProvider<ProfileViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) async {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _ProfileMobile(viewModel),
        );
      }
    );
  }
}
