import 'package:scheduleapp/core/base/base_view_model.dart';
import 'package:scheduleapp/core/locator.dart';
import 'package:scheduleapp/core/logger.dart';
import 'package:scheduleapp/views/login/login_view.dart';
import 'package:logger/logger.dart';

class HomeViewModel extends BaseViewModel {
  int _counter;
  Logger _logger = getLogger("HomeViewModel");

  HomeViewModel({int counter = 0}) : this._counter = counter;

  int get counter => this._counter;
  set counter(int value) {
    this._counter = value;
    notifyListeners();

    _logger.log(Level.info, "test message");
  }

  void increment() => this.counter += 1;
}