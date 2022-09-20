import 'package:flutter_tv/common/http.dart';

class User {
  login() {
    return dio.get('/');
  }
}
