// ignore_for_file: avoid_print

import 'package:assignment_ropstam/repository/auth_repo/signup_repsitory.dart';
import 'package:assignment_ropstam/utils/routes/routes_name.dart';
import 'package:assignment_ropstam/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class SignUpViewModel with ChangeNotifier {
  bool _signuploading = false;

  bool get signuploading => _signuploading;

  setLoading(bool value) {
    _signuploading = value;
    notifyListeners();
  }

  final _myrepo = SignUpRepository();
  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myrepo.signUpApi(data).then(
      (value) {
        {
          print(value.toString());
          if (kDebugMode) {
            print(value.toString());
          }
          setLoading(false);
          Utils.toastMessage(message: 'SignUp Successful');
          Navigator.pushNamed(
            context,
            RoutesName.home,
          );
        }
      },
    ).onError((error, stackTrace) {
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
