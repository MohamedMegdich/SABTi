import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  Dio dio = new Dio();

  login(email, password, role) async {
    try {
      return await dio.post('https://sabti.herokuapp.com/authenticate',
          data: {"email": email, "password": password, "role": role},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  addUser(email, password, role, name, familyName, address) async {
    try {
      return await dio.post('https://sabti.herokuapp.com/adduser',
          data: {
            "email": email,
            "password": password,
            "role": role,
            "name": name,
            "familyName": familyName,
            "address": address
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  getinfo(token) async {
    dio.options.headers["Authorization"] = 'ok $token';
    return await dio.get('https://sabti.herokuapp.com/getinfo');
  }
}
