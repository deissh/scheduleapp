part of tabs_view;

class _TabsTablet extends StatelessWidget {
  final TabsViewModel viewModel;

  _TabsTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('TabsTablet')),
    );
  }
}