import 'package:assignment_ropstam/res/widgets/text_field_widget.dart';
import 'package:assignment_ropstam/res/widgets/universal_widget.dart';
import 'package:assignment_ropstam/utils/helper/string_captial_first_letter_extension.dart';
import 'package:assignment_ropstam/utils/routes/routes_name.dart';
import 'package:assignment_ropstam/utils/utils.dart';
import 'package:assignment_ropstam/view_model/auth_view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'WELCOME BACK',
                      style: TextStyle(
                          fontSize: 26,
                          color: Theme.of(context).primaryColorLight,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Sign in to your account',
                      style: TextStyle(
                          fontSize: 12,
                          color:
                              Theme.of(context).highlightColor.withOpacity(0.8),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  primaryButtonLoading(
                    context: context,
                    onTap: () async {},
                    passButtonText: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 19,
                          height: 19,
                          child: Image.asset(
                            'assets/images/google.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Sign in with google',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      ],
                    ),
                    passButtonColor: Theme.of(context).primaryColorDark,
                    passBorder: Border.all(
                      color:
                          Theme.of(context).primaryColorLight.withOpacity(0.2),
                      width: 1.0,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      bottomLine(
                          width: MediaQuery.of(context).size.width * 0.38,
                          passcolor:
                              Theme.of(context).hintColor.withOpacity(0.3),
                          height: 1.0,
                          context: context),
                      Expanded(
                        child: Center(
                          child: Text(
                            'or',
                            style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).highlightColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      bottomLine(
                          width: MediaQuery.of(context).size.width * 0.38,
                          height: 1.0,
                          passcolor:
                              Theme.of(context).hintColor.withOpacity(0.3),
                          context: context),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MyCustomTextFieldNew(
                    hintText: 'Enter email',
                    keyboardType: TextInputType.emailAddress,
                    passcontentpadding:
                        const EdgeInsets.fromLTRB(5, 14, 14, 14),
                    textCapitalization: TextCapitalization.none,
                    prefixIcon: Icon(
                      Icons.email,
                      color: Theme.of(context).highlightColor.withOpacity(0.5),
                    ),
                    passcontroller: email,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MyCustomTextFieldNew(
                    hintText: 'Enter password',
                    passtextInputAction: TextInputAction.done,
                    passcontentpadding:
                        const EdgeInsets.fromLTRB(5, 14, 14, 14),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: Icon(hidePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                      color: Theme.of(context).highlightColor.withOpacity(0.5),
                    ),
                    prefixIcon: Icon(
                      Icons.lock_open_rounded,
                      color: Theme.of(context).highlightColor.withOpacity(0.5),
                    ),
                    passcontroller: password,
                    obscureText: hidePassword,
                  ),
                  InkWell(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(12, 5, 1, 10),
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).primaryColorLight,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  primaryButtonLoading(
                    context: context,
                    onTap: () async {
                      FocusScope.of(context).unfocus();

                      if (email.text.isValidEmail() == false) {
                        Utils.snackBar(context,
                            passDuration: const Duration(milliseconds: 500),
                            message: 'Please enter a valid email address',
                            margin: EdgeInsets.fromLTRB(10, 0, 10,
                                MediaQuery.of(context).size.height * 0.86));
                      } else if (password.text.length < 6) {
                        Utils.snackBar(context,
                            passDuration: const Duration(milliseconds: 500),
                            message: 'Password length less than 6 char',
                            margin: EdgeInsets.fromLTRB(10, 0, 10,
                                MediaQuery.of(context).size.height * 0.86));
                      } else {
                        Map data = {
                          'email': 'eve.holt@reqres.in',
                          'password': 'pistol',
                        };
                        loginViewModel.loginApi(data, context);
                      }
                    },
                    passButtonText: loginViewModel.loading
                        ? customcircularprogress(
                            context: context,
                            passcolor: Theme.of(context).primaryColorDark,
                          )
                        : Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                    passButtonColor: Theme.of(context).primaryColorLight,
                    passBorder: Border.all(
                      color: Theme.of(context).primaryColorDark,
                      width: 1.0,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  primaryButtonLoading(
                    context: context,
                    onTap: () async {
                      Navigator.pushNamed(context, RoutesName.signUp);
                    },
                    passButtonText: Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    passButtonColor: Theme.of(context).primaryColorDark,
                    passBorder: Border.all(
                      color:
                          Theme.of(context).primaryColorLight.withOpacity(0.2),
                      width: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
