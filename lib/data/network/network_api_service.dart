import 'dart:convert';
import 'dart:io';
import 'package:assignment_ropstam/data/app_exceptions.dart';
import 'package:assignment_ropstam/data/network/base_api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getApiResponse(String url, bool tokentrue, String? token,
      dynamic queryParameters) async {
    dynamic responceJson;
    try {
      if (kDebugMode) {
        print('url url url url');
        print(url);
      }
      Dio dio = Dio();
      if (tokentrue == true) {
        dio.options.headers["Authorization"] = "Bearer $token";
      }
      Response responce = await dio
          .get(url, queryParameters: queryParameters)
          .timeout(const Duration(seconds: 20));
      responceJson = returnResponce(responce);
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.toString());
        print(e.response!.statusCode.toString());
      }
      if (e.isNoConnectionError) {
        throw FetchDataException('No Internet Conection');
      } else if (e.response!.statusCode == 404) {
        throw UnauthorizedException('');
      } else if (e.response!.statusCode == 500) {
        debugPrint("e.response!.statusCode.toString()");
        debugPrint(e.response!.statusCode.toString());
        throw FetchDataException('');
      } else if (e.response!.statusCode == 422) {
        throw DataInvalidException(e.response!.data['message']);
      } else if (e.response!.statusCode == 403) {
        throw ForbiddenException(e.response!.data['message']);
      } else {
        debugPrint(e.response!.statusCode.toString());

        throw DefaultException('');
      }
    }
    return responceJson;
  }

  @override
  Future postApiResponse(
      String url, dynamic data, bool tokentrue, String? token) async {
    dynamic responceJson;
    if (kDebugMode) {
      print('url url url url');
      print(url);
      print(data.toString());
    }
    try {
      Dio dio = Dio();
      if (tokentrue == true) {
        dio.options.headers["Authorization"] = "Bearer $token";
      }
      Response responce =
          await dio.post(url, data: data).timeout(const Duration(seconds: 40));
      responceJson = returnResponce(responce);
    } on DioError catch (e) {
      if (kDebugMode) {
        print('e.toString()');
        print(e.response!.data.toString());
      }
      if (e.isNoConnectionError) {
        throw FetchDataException('No Internet Conection');
      } else if (e.response!.statusCode == 404) {
        throw UnauthorizedException('');
      } else if (e.response!.statusCode == 400) {
        throw UnauthorizedException('');
      } else if (e.response!.statusCode == 201) {
        throw UnauthorizedException('');
      } else if (e.response!.statusCode == 500) {
        throw FetchDataException('');
      } else if (e.response!.statusCode == 422) {
        throw DataInvalidException(e.response!.data['message']);
      } else {
        throw DefaultException('${e.response!.statusCode}');
      }
    }

    return responceJson;
  }

  /// delete Api responses
  ///
  @override
  Future deleteApiResponse(String url, String? token) async {
    dynamic responceJson;
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      Response responce =
          await dio.delete(url).timeout(const Duration(seconds: 20));
      responceJson = returnResponce(responce);
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.toString());
        print(e.response!.statusCode.toString());
      }
      if (e.isNoConnectionError) {
        throw FetchDataException('No Internet Conection');
      } else if (e.response!.statusCode == 404) {
        throw UnauthorizedException('');
      } else if (e.response!.statusCode == 500) {
        throw FetchDataException('');
      } else if (e.response!.statusCode == 422) {
        throw DataInvalidException(e.response!.data['message']);
      } else {
        throw FetchDataException('${e.response!.statusCode}');
      }
    }
    return responceJson;
  }

  dynamic returnResponce(Response responce) {
    switch (responce.statusCode) {
      case 200:
        dynamic responceJson = jsonDecode(responce.toString());
        return responceJson;
    }
  }
}

extension DioErrorX on DioError {
  bool get isNoConnectionError =>
      type == DioErrorType.unknown &&
      error is SocketException; // import 'dart:io' for SocketException
}
