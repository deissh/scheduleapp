library news_view;

import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:scheduleapp/widgets/app_bar.dart';
import 'news_view_model.dart';

part 'news_mobile.dart';

class NewsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsViewModel viewModel = NewsViewModel();
    return ViewModelProvider<NewsViewModel>.withConsumer(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _NewsMobile(viewModel),
        );
      }
    );
  }
}
