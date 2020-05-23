part of profile_view;

class _ProfileMobile extends StatelessWidget {
  final ProfileViewModel viewModel;

  _ProfileMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor
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
                    child: Icon(Icons.settings, size: 30, color: Theme.of(context).accentIconTheme.color),
                  ),
                ),

                Spacer(),

                GestureDetector(
                  onTap: viewModel.logout,

                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Icon(Icons.exit_to_app, size: 30, color: Theme.of(context).accentIconTheme.color),
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
                    backgroundColor: Theme.of(context).textSelectionColor,
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
            Text(viewModel.user.displayName, style: TextStyle(fontSize: 22.0, color: Colors.white)),
            Text(
              "Группа " +
              (viewModel.user.group == "none" ? "Группа не выбрана" : viewModel.user.group),
              style: TextStyle(fontSize: 14.0, color: Colors.white)
            ),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
