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
        title: "Расписание",
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Visibility(
            visible: viewModel.motds.length > 0,
            child: Container(
              height: 170,
              child: new ListView.builder(
                padding: EdgeInsets.all(15),
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
              selectedDate: viewModel.selectedDay,
              startDate: firstMonday(),
              endDate: firstMonday().add(new Duration(days: 7)),
              onDateSelected: (data) {
                viewModel.selectedDay = data;
              },
              dateTileBuilder: (date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
                bool isSelectedDate = date.compareTo(selectedDate) == 0;
                Color fontColor = isDateOutOfRange ? Colors.black26 : Colors.black87;

                TextStyle normalStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: fontColor);
                TextStyle todayStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.red);
                TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: fontColor);

                List<Widget> _children = [
                  Text(dayName, style: dayNameStyle),
                  Text(date.day.toString(), style: DateTime.now().day != date.day ? normalStyle : todayStyle),
                ];

                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
                  decoration: BoxDecoration(
                    color: !isSelectedDate ? Colors.transparent : Color.fromRGBO(240,239,242, 1),
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
            )
          ),


          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                ScheduleItem(null),
                ScheduleItem(null),

                ScheduleDivider(
                  "Обед",
                  "",
                  "11:50",
                  "12:30"
                ),

                ScheduleItem(null),
                ScheduleItem(null),

              ],
            ),
          )
        ]
      ),
    );
  }
}
