import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:scheduleapp/core/config.dart';

class AccessToken {
    String accessToken;
    String tokenType;
    int expiresIn;

    AccessToken({
        @required this.accessToken,
        @required this.tokenType,
        @required this.expiresIn,
    });

    AccessToken copyWith({
        String accessToken,
        String tokenType,
        int expiresIn,
    }) =>
        AccessToken(
            accessToken: accessToken ?? this.accessToken,
            tokenType: tokenType ?? this.tokenType,
            expiresIn: expiresIn ?? this.expiresIn,
        );

    factory AccessToken.fromJson(String str) => AccessToken.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AccessToken.fromMap(Map<String, dynamic> json) => AccessToken(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
    );

    Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
    };
}


class AuthAPI {
  Dio _dio;

  AuthAPI(this._dio);

  Future<AccessToken> createToken(String username, String password) async {
    var res = await _dio.post("$OAUTH2_SERVICE_URL/oauth/token",
      data: {
        "grant_type": "password",
        "username": username,
        "password": password,

        "client_secret": CLIENT_SECRET,
        "client_id": CLIENT_ID
      },
      options: Options(contentType:Headers.formUrlEncodedContentType )
    );

    return AccessToken.fromMap(res.data);
  }
}
