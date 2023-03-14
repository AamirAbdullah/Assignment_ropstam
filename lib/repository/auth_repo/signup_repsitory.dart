

import 'package:assignment_ropstam/data/network/base_api_services.dart';
import 'package:assignment_ropstam/data/network/network_api_service.dart';
import 'package:assignment_ropstam/utils/constants/app_url.dart';

class SignUpRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiService.postApiResponse(AppUrl.registerApiEndPoint , data,false,'');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}