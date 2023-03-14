import 'package:assignment_ropstam/res/widgets/text_field_widget.dart';
import 'package:assignment_ropstam/res/widgets/universal_widget.dart';
import 'package:assignment_ropstam/utils/helper/string_captial_first_letter_extension.dart';
import 'package:assignment_ropstam/view_model/auth_view_model/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  final bool? formpageNavigation;
  const SignUpView({Key? key, this.formpageNavigation}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool hideConPassword = true;
  String? email;
  String? name;
  String? mobileNum;
  String? selectedGender;
  String? password;
  String? conPassword;
  final confirmPassfocus = FocusNode();
  final passfocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final signUpViewModel = Provider.of<SignUpViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 0, 20, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 20, top: 10, left: 2, bottom: 30),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Theme.of(context).primaryColorLight,
                      size: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 36,
                              color: Theme.of(context).primaryColorLight,
                              fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          'Please fill the below fields to create your account',
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context)
                                  .primaryColorLight
                                  .withOpacity(0.8),
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        MyCustomTextFieldNew(
                          hintText: 'Enter name',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Theme.of(context)
                                .highlightColor
                                .withOpacity(0.5),
                          ),
                          keyboardType: TextInputType.text,
                          passcontentpadding:
                              const EdgeInsets.fromLTRB(5, 14, 14, 14),
                          validator: (val) =>
                              val!.isEmpty ? "Please enter your name" : null,
                          onChanged: (val) {
                            name = val;
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        MyCustomTextFieldNew(
                          keyboardType: TextInputType.emailAddress,
                          hintText: 'Enter email',
                          textCapitalization: TextCapitalization.none,
                          passcontentpadding:
                              const EdgeInsets.fromLTRB(5, 14, 14, 14),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Theme.of(context)
                                .highlightColor
                                .withOpacity(0.5),
                          ),
                          validator: (val) => val!.isValidEmail()
                              ? null
                              : "Please enter a valid email address",
                          onChanged: (val) {
                            email = val;
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        MyCustomTextFieldNew(
                          keyboardType: TextInputType.number,
                          hintText: 'Enter mobile number',
                          passonFieldSubmitted: (val) {
                            FocusScope.of(context).requestFocus(passfocus);
                          },
                          passcontentpadding:
                              const EdgeInsets.fromLTRB(5, 14, 14, 14),
                          prefixIcon: Icon(
                            Icons.mobile_screen_share,
                            color: Theme.of(context)
                                .highlightColor
                                .withOpacity(0.5),
                          ),
                          validator: (val) => val!.isEmpty
                              ? "Please enter your mobile number"
                              : val.length < 9
                                  ? "Please enter correct mobile number"
                                  : null,
                          onChanged: (val) {
                            mobileNum = val;
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        MyCustomTextFieldNew(
                          hintText: 'Enter password',
                          passcontentpadding:
                              const EdgeInsets.fromLTRB(5, 14, 14, 14),
                          passfocusNode: passfocus,
                          passonFieldSubmitted: (val) {
                            FocusScope.of(context)
                                .requestFocus(confirmPassfocus);
                          },
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            icon: Icon(hidePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                            color: Theme.of(context)
                                .highlightColor
                                .withOpacity(0.5),
                          ),
                          prefixIcon: Icon(
                            Icons.lock_open_rounded,
                            color: Theme.of(context)
                                .highlightColor
                                .withOpacity(0.5),
                          ),
                          validator: (val) => val!.isEmpty
                              ? 'Please enter password'
                              : val.length < 6
                                  ? "Please enter 6 digit password"
                                  : null,
                          obscureText: hidePassword,
                          onChanged: (val) {
                            password = val;
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        MyCustomTextFieldNew(
                          hintText: 'Confirm password',
                          passfocusNode: confirmPassfocus,
                          passcontentpadding:
                              const EdgeInsets.fromLTRB(5, 14, 14, 14),
                          passtextInputAction: TextInputAction.done,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hideConPassword = !hideConPassword;
                              });
                            },
                            icon: Icon(hideConPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                            color: Theme.of(context)
                                .highlightColor
                                .withOpacity(0.5),
                          ),
                          prefixIcon: Icon(
                            Icons.lock_open_rounded,
                            color: Theme.of(context)
                                .highlightColor
                                .withOpacity(0.5),
                          ),
                          obscureText: hideConPassword,
                          validator: (val) => val != password
                              ? "Please confirm your password"
                              : null,
                          onChanged: (value) {
                            conPassword = value;
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
                primaryButtonLoading(
                  context: context,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      Map data = {
                        'email': email,
                        'password': password,
                      };
                      signUpViewModel.signUpApi(data, context);
                    }
                  },
                  passButtonText:signUpViewModel.signuploading
                        ? customcircularprogress(
                            context: context,
                            passcolor: Theme.of(context).primaryColorDark,
                          )
                        : Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  passButtonColor: Theme.of(context).primaryColorLight,
                  passBorder: Border.all(
                    color: Theme.of(context).primaryColorLight,
                    width: 1.0,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
