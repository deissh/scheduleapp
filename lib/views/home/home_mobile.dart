part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;
  final NavigatorService _navigator = locator<NavigatorService>();

  _HomeMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Расписание",
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              
              
            ],
          ),
        ),
    );
  }
}
