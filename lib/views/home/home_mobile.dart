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
                return Container(
                    padding: EdgeInsets.all(5),
                    width: 250,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[

                            Text(
                              "13/04 12:53",
                              style: TextStyle(
                                color: Color.fromRGBO(162,161,164,1)
                              ),
                            ),

                            Text("very long message of the day"),
                            Spacer(),

                            Row(children: <Widget>[
                              Text("Замена"),
                              Spacer(),
                              Container(
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red
                                ),
                                width: 10.0,
                                height: 10.0,
                              ),
                            ])
                          ],
                        )
                      ),
                    ),
                  );
              },
            )
          ),

        ],
      ),
    );
  }
}
