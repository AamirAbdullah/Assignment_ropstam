// ignore_for_file: use_build_context_synchronously

import 'package:assignment_ropstam/utils/routes/routes_name.dart';
import 'package:assignment_ropstam/view_model/services/session_manager.dart';
import 'package:flutter/material.dart';

class SplashServices {
  final sessionManager = SessionManager();
  void checkAuthentication(BuildContext context) async {
    final sessionData = await sessionManager.getSession();
    if (sessionData == null) {
      await Future.delayed(const Duration(seconds: 3));
      Navigator.pushNamed(context, RoutesName.logIn);
    } else {
      await Future.delayed(const Duration(seconds: 3));
      Navigator.pushNamed(context, RoutesName.home);
    }
  }
}
