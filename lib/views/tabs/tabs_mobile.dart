part of tabs_view;

class _TabsMobile extends StatelessWidget {
  final TabsViewModel viewModel;

  _TabsMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: viewModel.tabs.length,
      child: new Scaffold(
        body: TabBarView(
          // physics: NeverScrollableScrollPhysics(),
          children: <Widget>[

            HomeView(),
            NewsView(),
            ProfileView()
            // NotificationsView(),
            // HomeView(),

          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color.fromRGBO(184,186,202, 0.3),
                width: 1.0,
              )
            )
          ),
          child: new TabBar(
            tabs: this.viewModel.getTabs(),

            // todo: this
            labelColor: Color.fromRGBO(113,116,133, 1.0),
            unselectedLabelColor: Color.fromRGBO(184,186,202, 1.0),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Color.fromRGBO(113,116,133, 1.0),
          ),
        ),
      ),
    );
  }
}
