import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

Future getHomePageContent() async {
  try {
    Response resp;
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded').toString();
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    resp = await dio.post(servicePath['homePageContent'], data: formData);
    if (resp.statusCode == 200) {
      return resp.data;
    } else {
      throw Exception('后端接口异常，请检查代码和服务器情况...');
    }
  } catch (e) {
    return print('Error: $e');
  }
}

Future getHomePageBelowContent() async {
  try {
    Response resp;
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded').toString();
    int page = 1;
    resp = await dio.post(servicePath['homePageBelowContent'], data: page);
    if (resp.statusCode == 200) {
      return resp.data;
    } else {
      throw Exception('后端接口异常，请检查代码和服务器情况...');
    }
  } catch (e) {
    return print('Error: $e');
  }
}

Future request(url, {formData}) async {
  try {
    Response resp;
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse('application/x-www-form-urlencoded').toString();
    if (formData == null) {
      resp = await dio.post(servicePath[url]);
    } else {
      resp = await dio.post(servicePath[url], data: formData);
    }

    if (resp.statusCode == 200) {
      return resp.data;
    } else {
      throw Exception('后端接口异常，请检查代码和服务器情况...');
    }
  } catch (e) {
    return print('Error: $e');
  }
}
