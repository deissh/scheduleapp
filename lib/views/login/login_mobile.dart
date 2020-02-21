part of login_view;

class _LoginMobile extends StatelessWidget {
  final LoginViewModel viewModel;

  _LoginMobile(this.viewModel);


  final loginField = TextFormField(
    keyboardType: TextInputType.emailAddress,
    autofocus: false,
    initialValue: 'admin@gmail.com',
    decoration: InputDecoration(
      hintText: 'Email',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
    ),
    style: TextStyle(
      color: Colors.white,
    ),
  );


  final passwordField = TextFormField(
    autofocus: false,
    initialValue: 'some password',
    obscureText: true,
    decoration: InputDecoration(
      hintText: 'Password',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
    ),
    style: TextStyle(
      color: Colors.white,
    ),
  );


  loginButton (context) => Container(
    width: double.infinity,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () async {
        await viewModel.login();
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
      backgroundColor: Theme.of(context).primaryColor,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              children: <Widget>[
                Spacer(),

                loginField,
                SizedBox(height: 15.0),
                passwordField,
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
