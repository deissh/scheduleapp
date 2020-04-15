import 'package:dio/dio.dart';
import 'package:scheduleapp/core/api/auth.dart';
import 'package:scheduleapp/core/base/base_service.dart';

class ApiService extends BaseService {
  final Dio _dio = new Dio();
  String _accessToken = "";

  // todo: load access_token from storage
  ApiService();

  Future<void> login(String username, String password) async {
    var auth = new AuthAPI(this._dio);
    var token = await auth.createToken(username, password);

    _accessToken = token.accessToken;

    return token;
  }
}
