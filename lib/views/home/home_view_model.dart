import 'package:scheduleapp/core/base/base_view_model.dart';
import 'package:scheduleapp/core/dto/motd.dart';
import 'package:scheduleapp/core/dto/week_schedule.dart';

class HomeViewModel extends BaseViewModel {
  List<Motd> motds = [];
  WeekScheduleDto week;

  HomeViewModel();


  loadEvents() async {
    log.d("loading MOTD");
    await Future.delayed(Duration(seconds: 3));

    motds = [
      Motd.fromJson('{"id": "4d31304c-d53a-4166-9f7b-a34e4ea8382e","created_at": "2020-04-14T10:25:12+0000","message": "lorem ipsu","type": "Обновление","type_color": "#EEF6ff"}'),
      Motd.fromJson('{"id": "4d31304c-d53a-4166-9f7b-a34e4ea8382e","created_at": "2020-04-14T10:25:12+0000","message": "lorem ipsu","type": "Обновление","type_color": "#6666ff"}'),
    ];
    notifyListeners();
  }
}
