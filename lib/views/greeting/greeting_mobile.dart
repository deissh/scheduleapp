part of greeting_view;

class _GreetingMobile extends StatelessWidget {
  final GreetingViewModel viewModel;

  _GreetingMobile(this.viewModel);

  Widget _getGreating(BuildContext context) {
    return Column(
      children: <Widget>[
        DelayedAnimation(
          child: Text(
            viewModel.gretting,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
              color: Colors.white
            ),
          ),
          delay: 1500,
        ),

        DelayedAnimation(
          child: Text(
            viewModel.user?.displayName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
              color: Colors.white,
            ),
          ),
          delay: 3500,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: <Widget>[
                Spacer(),

                if (viewModel.user != null) _getGreating(context),

                Spacer(),

                DelayedAnimation(
                  child: Text(
                    viewModel.status,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  delay: 500,
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
