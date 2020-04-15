part of login_view;

class _LoginMobile extends StatelessWidget {
  final LoginViewModel viewModel;

  _LoginMobile(this.viewModel);


  Widget loginField() {
    return TextFormField(
      controller: viewModel.loginController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Логин',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }


  Widget passwordField () {
    return TextFormField(
      controller: viewModel.passController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Пароль',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }


  Widget loginButton (context) => Container(
    width: double.infinity,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () async {
        await viewModel.login(context);
      },
      padding: EdgeInsets.all(15),
      color: Theme.of(context).bottomAppBarColor,
      child: Text('Войти', style: TextStyle(color: Colors.black)),
    ),
  );

  final forgotLabel = FlatButton(
    child: Text(
      'Забыли пароль?',
      style: TextStyle(color: Colors.black54),
    ),
    onPressed: () {},
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              children: <Widget>[
                Spacer(),

                loginField(),
                SizedBox(height: 15.0),
                passwordField(),
                SizedBox(height: 50.0),
                loginButton(context),
                forgotLabel,

              ],
            ),
          ),
        )
      ),
    );
  }
}
