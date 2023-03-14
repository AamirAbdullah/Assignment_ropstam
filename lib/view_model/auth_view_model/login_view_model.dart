// ignore_for_file: avoid_print

import 'package:assignment_ropstam/repository/auth_repo/login_repository.dart';
import 'package:assignment_ropstam/utils/routes/routes_name.dart';
import 'package:assignment_ropstam/utils/utils.dart';
import 'package:assignment_ropstam/view_model/services/session_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  bool _loading = false;
  String? token;
  bool get loading => _loading;
  final sessionManager = SessionManager();
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final _myrepo = LoginRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myrepo.loginApi(data).then((value) async {
      {
        setLoading(false);
        token = value['token'] ?? '';
        final sessionData = {
          'accessToken': token.toString(),
          'username': 'expiryTime',
        };
        await sessionManager.saveSession(sessionData).then((value) {
          Navigator.pushNamed(
            context,
            RoutesName.home,
          );
          Utils.toastMessage(message: 'Login Successful');
        });
      }
    }).onError((error, stackTrace) {
      {
        setLoading(false);
        Utils.toastMessage(message: error.toString());
        if (kDebugMode) {
          print(error.toString());
        }
      }
    });
  }
}
