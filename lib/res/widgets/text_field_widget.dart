// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable


import 'package:assignment_ropstam/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class MyCustomTextField extends StatelessWidget {
  // Declare your custom vars, including your validator function
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final EdgeInsetsGeometry? passcontentpadding;
  final Color? passenabledBorder;
  final BorderRadius? passborderradious;
  final bool? passreadonly;
  final Color? passhintColor;
  final double? passhintFontSize;
  final Color? passfillColor;
  final List<TextInputFormatter>? passinputFormatters;
  final Function()? passonTapTextfield;
  final TextEditingController? passcontroller;
  final int? passmaxLines;
  final String? passinitialValue;
  final TextStyle? passerrorStyle;
  final TextInputAction? passtextInputAction;
  final void Function(String)? passonFieldSubmitted;
  final TextCapitalization? textCapitalization;
  final FocusNode? passfocusNode;

  const MyCustomTextField({
    Key? key,
    this.hintText,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    this.onChanged,
    this.passcontentpadding,
    this.passenabledBorder,
    this.passborderradious,
    this.passreadonly,
    this.passhintColor,
    this.passhintFontSize,
    this.passfillColor,
    this.passinputFormatters,
    this.passonTapTextfield,
    this.passcontroller,
    this.passmaxLines,
    this.passinitialValue,
    this.passerrorStyle,
    this.passtextInputAction,
    this.passonFieldSubmitted,
    this.passfocusNode,
    this.textCapitalization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: passfocusNode,
      textAlignVertical: TextAlignVertical.bottom,
      initialValue: passinitialValue,
      maxLines: passmaxLines ?? 1,
      keyboardType: keyboardType,
      onTap: passonTapTextfield ?? () {},
      inputFormatters: passinputFormatters,
      textCapitalization: textCapitalization ?? TextCapitalization.words,
      controller: passcontroller,
      readOnly: passreadonly ?? false,
      textInputAction: passtextInputAction ?? TextInputAction.next,
      onFieldSubmitted: passonFieldSubmitted,
      style: TextStyle(
          color: Theme.of(context).primaryColorLight,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        hintText: hintText,
        errorStyle: passerrorStyle,
        hintStyle: TextStyle(
          color: passhintColor ??
              Theme.of(context).highlightColor.withOpacity(0.6),
          fontWeight: FontWeight.w400,
          fontSize: passhintFontSize ?? 12,
        ),
        contentPadding:
            passcontentpadding ?? const EdgeInsets.fromLTRB(30, 14, 14, 14),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        errorBorder: OutlineInputBorder(
            borderRadius: passborderradious ??
                const BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
              color: passenabledBorder ?? Theme.of(context).hintColor,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: passborderradious ??
                const BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
              color: passenabledBorder ?? Theme.of(context).hintColor,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: passborderradious ??
                const BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
              color: passenabledBorder ?? Theme.of(context).hintColor,
            )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: passenabledBorder ?? Theme.of(context).hintColor,
            ),
            borderRadius: passborderradious ??
                const BorderRadius.all(Radius.circular(12.0))),
        fillColor: passfillColor ?? Theme.of(context).disabledColor,
        filled: true,
      ),
      obscureText: obscureText ?? false,
      validator: validator,
      onChanged: onChanged,
    );
  }
}

///////////////////////////////////////////////////////////////////

class MyCustomTextFieldNew extends StatelessWidget {
  // Declare your custom vars, including your validator function
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final EdgeInsetsGeometry? passcontentpadding;
  final Color? passenabledBorder;
  final BorderRadius? passborderradious;
  final bool? passreadonly;
  final Color? passhintColor;
  final double? passhintFontSize;
  final Color? passfillColor;
  final List<TextInputFormatter>? passinputFormatters;
  final Function()? passonTapTextfield;
  final TextEditingController? passcontroller;
  final int? passmaxLines;
  final String? passinitialValue;
  final TextStyle? passerrorStyle;
  final TextInputAction? passtextInputAction;
  final void Function(String)? passonFieldSubmitted;
  final void Function()? onEditingComplete;
  final TextCapitalization? textCapitalization;
  final FocusNode? passfocusNode;

  const MyCustomTextFieldNew({
    Key? key,
    this.hintText,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    this.onChanged,
    this.passcontentpadding,
    this.passenabledBorder,
    this.passborderradious,
    this.passreadonly,
    this.passhintColor,
    this.passhintFontSize,
    this.passfillColor,
    this.passinputFormatters,
    this.passonTapTextfield,
    this.passcontroller,
    this.passmaxLines,
    this.passinitialValue,
    this.passerrorStyle,
    this.passtextInputAction,
    this.passonFieldSubmitted,
    this.passfocusNode,
    this.textCapitalization,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: passfocusNode,
      textAlignVertical: TextAlignVertical.bottom,
      initialValue: passinitialValue,
      maxLines: passmaxLines ?? 1,
      keyboardType: keyboardType,
      onEditingComplete: onEditingComplete,
      onTap: passonTapTextfield ?? () {},
      inputFormatters: passinputFormatters,
      textCapitalization: textCapitalization ?? TextCapitalization.words,
      controller: passcontroller,
      readOnly: passreadonly ?? false,
      textInputAction: passtextInputAction ?? TextInputAction.next,
      onFieldSubmitted: passonFieldSubmitted,
      style: TextStyle(
          color: Theme.of(context).primaryColorLight,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        hintText: hintText,
        // errorStyle: passerrorStyle,
        hintStyle: TextStyle(
          color: passhintColor ?? Theme.of(context).highlightColor,
          fontWeight: FontWeight.w400,
          fontSize: passhintFontSize ?? 14,
        ),
        contentPadding:
            passcontentpadding ?? const EdgeInsets.fromLTRB(30, 14, 14, 14),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: passenabledBorder ?? Colors.red,
        )),
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: passenabledBorder ?? Colors.red,
        )),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color:
              passenabledBorder ?? Theme.of(context).hintColor.withOpacity(0.5),
        )),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: passenabledBorder ??
                Theme.of(context).hintColor.withOpacity(0.5),
          ),
        ),
        // fillColor: passfillColor ?? Theme.of(context).disabledColor,
        // filled: true,
      ),
      obscureText: obscureText ?? false,
      validator: validator,
      onChanged: onChanged,
    );
  }
}

/// Drop Down Decoration Old
InputDecoration dropdowndecoration({
  BorderRadius? passborderradious,
  Color? passenabledBorder,
  EdgeInsetsGeometry? passcontentpadding,
  Color? passfillColor,
  BuildContext? context,
}) {
  return InputDecoration(
    hintStyle: TextStyle(
        color: AppColor().hinttextfeildColor,
        fontWeight: FontWeight.w400,
        fontSize: 12),
    contentPadding:
        passcontentpadding ?? const EdgeInsets.fromLTRB(0, 10, 10, 2),
    errorBorder: OutlineInputBorder(
        borderRadius:
            passborderradious ?? const BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(
          color: passenabledBorder ?? Theme.of(context!).highlightColor,
        )),
    focusedErrorBorder: OutlineInputBorder(
        borderRadius:
            passborderradious ?? const BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(
          color: passenabledBorder ?? Theme.of(context!).highlightColor,
        )),
    enabledBorder: OutlineInputBorder(
        borderRadius:
            passborderradious ?? const BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(
          color: passenabledBorder ?? Theme.of(context!).highlightColor,
        )),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: passenabledBorder ?? Theme.of(context!).highlightColor,
        ),
        borderRadius:
            passborderradious ?? const BorderRadius.all(Radius.circular(12.0))),
    fillColor:
        passfillColor ?? Theme.of(context!).disabledColor.withOpacity(0.2),
    filled: true,
  );
}

/// Drop Down Decoration New
InputDecoration dropdowndecorationNew({
  BorderRadius? passborderradious,
  Color? passenabledBorder,
  EdgeInsetsGeometry? passcontentpadding,
  Color? passfillColor,
  BuildContext? context,
}) {
  return InputDecoration(
    hintStyle: TextStyle(
        color: AppColor().hinttextfeildColor,
        fontWeight: FontWeight.w400,
        fontSize: 12),
    contentPadding:
        passcontentpadding ?? const EdgeInsets.fromLTRB(0, 10, 10, 2),
    errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
      color: passenabledBorder ?? Colors.red,
    )),
    focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
      color: passenabledBorder ?? Colors.red,
    )),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
      color: passenabledBorder ?? Theme.of(context!).hintColor,
    )),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: passenabledBorder ?? Theme.of(context!).hintColor,
      ),
    ),
  );
}

//////////////Text Form Feild Profile ///////////////////
class TextFormprofile extends StatelessWidget {
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final String? initialValue;
  final String? hintText;
  final TextCapitalization? textCapitalization;
  const TextFormprofile({
    Key? key,
    this.validator,
    this.initialValue,
    this.hintText,
    this.onSaved,
    this.textCapitalization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue ?? '',
      textCapitalization: textCapitalization ?? TextCapitalization.words,
      style: TextStyle(
          color: Theme.of(context).primaryColorLight,
          fontSize: 18,
          fontWeight: FontWeight.w400),
      cursorColor: Theme.of(context).indicatorColor,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: AppColor().profileHintTextColor,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).indicatorColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).indicatorColor),
        ),
      ),
      onChanged: onSaved,
      validator: validator,
    );
  }
}

///////////// profile container textfeild decoration ///////////
InputDecoration containertextfeilddecoration() {
  return const InputDecoration(
    contentPadding: EdgeInsets.all(10),
    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
  );
}

////////////////////////////phone no decoration//////////////////////////////////
InputDecoration phonenumberdecoration({
  String? hintText,
  Color? passhintColor,
  EdgeInsetsGeometry? passcontentpadding,
  Widget? prefixIcon,
  Widget? suffixIcon,
  BorderRadius? passborderradious,
  Color? passenabledBorder,
  Color? passfillColor,
  BuildContext? context,
}) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
        color: passhintColor ?? AppColor().hinttextfeildColor,
        fontWeight: FontWeight.w400,
        fontSize: 12),
    contentPadding:
        passcontentpadding ?? const EdgeInsets.fromLTRB(50, 14, 14, 14),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
      color: passenabledBorder ?? Colors.red,
    )),
    focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
      color: passenabledBorder ?? Colors.red,
    )),
    enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
      color: passenabledBorder ?? Theme.of(context!).hintColor,
    )),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: passenabledBorder ?? Theme.of(context!).hintColor,
      ),
    ),
    fillColor: passfillColor ?? Theme.of(context!).hintColor.withOpacity(0.2),
    filled: true,
  );
}

///////////////////////// DropDown Search //////////////////////////////
///

// myCustomDropDownSearch({
//   List<String>? passitems,
//   Widget? passlabel,
//   Function(String?)? passonChanged,
//   String? Function(String?)? passvalidator,
//   BuildContext? context,
// }) {
//   return DropdownSearch<String>(
//     items: passitems,
//     mode: Mode.MENU,
//     showSearchBox: true,
//     dropDownButton: Icon(
//       FontAwesomeIcons.chevronDown,
//       size: 15,
//       color: AppColor().hinttextfeildColor,
//     ),
//     dropdownSearchDecoration: InputDecoration(
//       label: passlabel,
//       contentPadding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
//       errorStyle: const TextStyle(),
//       errorBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(
//         color: Colors.red,
//       )),
//       focusedErrorBorder: const UnderlineInputBorder(
//           borderSide: BorderSide(
//         color: Colors.red,
//       )),
//       enabledBorder: UnderlineInputBorder(
//           borderSide: BorderSide(
//         color: Theme.of(context!).hintColor,
//       )),
//       focusedBorder: UnderlineInputBorder(
//         borderSide: BorderSide(
//           color: Theme.of(context).hintColor,
//         ),
//       ),
//     ),
//     onChanged: passonChanged,
//     validator: passvalidator,
//   );
// }
