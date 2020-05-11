library sign_in_view;

import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/widgets/delayed_animation.dart';
import 'sign_in_view_model.dart';

part 'sign_in_mobile.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SignInViewModel viewModel = SignInViewModel();
    return ViewModelProvider<SignInViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _SignInMobile(viewModel),
        );
      }
    );
  }
}
