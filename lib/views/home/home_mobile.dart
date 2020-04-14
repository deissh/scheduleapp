part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;
  final NavigatorService _navigator = locator<NavigatorService>();

  _HomeMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Главная",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 170,
            child: new ListView.builder(
              padding: EdgeInsets.all(20),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext contex, int index) {
                return EventCard(
                  DateTime.now(),
                  "Lorem iptsu",
                  "Обновление",
                  Colors.blue,
                );
              },
            )
          ),

        ],
      ),
    );
  }
}
