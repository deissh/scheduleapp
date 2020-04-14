part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;
  final NavigatorService _navigator = locator<NavigatorService>();

  _HomeMobile(this.viewModel);

  static DateTime firstMonday() {
    DateTime now = DateTime.now();
    return now.subtract(new Duration(days: now.weekday));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Главная",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Visibility(
            visible: viewModel.motds.length > 0,
            child: Container(
              height: 170,
              child: new ListView.builder(
              padding: EdgeInsets.all(20),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: viewModel.motds.length,
                itemBuilder: (BuildContext contex, int index) {
                  return EventCard(viewModel.motds[index]);
                },
              )
            ),
          ),

          Container(
            child: CalendarStrip(
              selectedDate: DateTime.now(),
              startDate: firstMonday(),
              endDate: firstMonday().add(new Duration(days: 7)),
              onDateSelected: () => {},
              dateTileBuilder: (date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
                bool isSelectedDate = date.compareTo(selectedDate) == 0;
                Color fontColor = isDateOutOfRange ? Colors.black26 : Colors.black87;
                TextStyle normalStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: fontColor);
                TextStyle selectedStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.red);
                TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: fontColor);
                List<Widget> _children = [
                  Text(dayName, style: dayNameStyle),
                  Text(date.day.toString(), style: !isSelectedDate ? normalStyle : selectedStyle),
                ];

                return AnimatedContainer(
                  duration: Duration(milliseconds: 150),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: !isSelectedDate ? Colors.transparent : Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(60)),
                  ),
                  child: Column(
                    children: _children,
                  ),
                );
              },
              iconColor: Colors.black87,
              monthNameWidget: (monthName) => Text(""),
              markedDates: [],
              containerDecoration: BoxDecoration(),
            ))
        ],
      ),
    );
  }
}
