part of sign_in_view;

class _SignInMobile extends StatelessWidget {
  final SignInViewModel viewModel;

  _SignInMobile(this.viewModel);

  Widget _googleButton(BuildContext context) {
    return OutlineButton(
      onPressed: () async {
        await viewModel.signIn(context, "google");
      },

      splashColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/google_logo.png", height: 30, color: Colors.white,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Войти с помощью Google',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
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

                DelayedAnimation(
                  child: Icon(Icons.calendar_today, size: 100, color: Colors.white,),
                  delay: 300,
                ),

                SizedBox(height: 50),

                DelayedAnimation(
                  child: Text(
                    "Мой колледж",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                      color: Colors.white
                    ),
                  ),
                  delay: 600,
                ),

                Spacer(),

                DelayedAnimation(
                  child: _googleButton(context),
                  delay: 1500,
                ),

              ],
            ),
          ),
        ),
      )
    );
  }
}
