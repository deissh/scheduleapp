part of greeting_view;

class _GreetingTablet extends StatelessWidget {
  final GreetingViewModel viewModel;

  _GreetingTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('GreetingTablet')),
    );
  }
}