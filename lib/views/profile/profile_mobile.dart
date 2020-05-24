part of profile_view;

class _ProfileMobile extends StatelessWidget {
  final ProfileViewModel viewModel;

  _ProfileMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        // color: Theme.of(context).primaryColor
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: viewModel.settings,

                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Icon(Icons.settings, size: 30, color: Color.fromRGBO(113,116,133, 1.0)),
                  ),
                ),

                Spacer(),

                GestureDetector(
                  onTap: viewModel.logout,

                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Icon(Icons.exit_to_app, size: 30, color: Color.fromRGBO(113,116,133, 1.0)),
                  ),
                )
              ],
            ),
            Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[

                Hero(
                  tag: "avatar",
                  child: CircleAvatar(
                    minRadius: 60,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: CircleAvatar(
                      backgroundImage: new CachedNetworkImageProvider(
                        viewModel.user.avatarUrl
                      ),
                      minRadius: 55,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(viewModel.user.displayName, style: TextStyle(fontSize: 22.0, color: Colors.black)),
            Text(
              viewModel.user.email,
              style: TextStyle(fontSize: 14.0, color: Colors.black, fontWeight: FontWeight.w300)
            ),
            SizedBox(height: 20),
            Text(
              "Группа ${GroupTranslator[viewModel.user.group]}",
              style: TextStyle(fontSize: 14.0, color: Colors.black)
            ),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
