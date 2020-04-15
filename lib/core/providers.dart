import '../core/locator.dart';
import '../core/services/navigator_service.dart';
import 'package:provider/provider.dart';

import 'services/api_service.dart';

class ProviderInjector {
  static List<SingleChildCloneableWidget> providers = [
    ..._independentServices,
    ..._dependentServices,
    ..._consumableServices,
  ];

  static List<SingleChildCloneableWidget> _independentServices = [
    Provider.value(value: locator<NavigatorService>()),
    Provider.value(value: locator<ApiService>()),
  ];

  static List<SingleChildCloneableWidget> _dependentServices = [];

  static List<SingleChildCloneableWidget> _consumableServices = [];
}
