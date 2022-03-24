import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tcc/config/service.dart';
import 'package:tcc/models/usuario.dart';

abstract class SepConfApi {
  static Future<dynamic> login(String nomeusu, String senha) async {
    var response = await Dio().putUri(
      Uri(
        scheme: "http",
        host: ServiceApp.ip,
        port: int.parse(ServiceApp.port),
        path: "/usuarios/login",
      ),
      options: Options(
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
      data: jsonEncode({
        "usuario": nomeusu.toUpperCase().trim(),
        "senha": senha.trim(),
      }),
    );

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = Map<String, dynamic>.from(response.data);
        //   print(response.data);
        return Usuario.fromMap(data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
