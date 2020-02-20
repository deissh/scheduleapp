part of guard_view;

class _GuardTablet extends StatelessWidget {
  final GuardViewModel viewModel;

  _GuardTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('GuardTablet')),
    );
  }
}