import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Utils {
  static toastMessage(
      {String? message, Color? backgroundColor, Color? textColor}) {
    Fluttertoast.showToast(
        backgroundColor: backgroundColor, textColor: textColor, msg: message!);
  }

  static snackBar(
    BuildContext context, {
    String? message,
    Color? backgroundColor,
    Color? textColor,
    Duration? passDuration,
    EdgeInsetsGeometry? margin,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: passDuration ?? const Duration(seconds: 2),
      backgroundColor: backgroundColor ?? Colors.red,
      padding: const EdgeInsets.all(15),
      content: Row(
        children: [
          Icon(
            Icons.error,
            color: Theme.of(context).primaryColorDark,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Text(
              message! 
                  ,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: textColor ?? Theme.of(context).primaryColorDark),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      margin: margin??const EdgeInsets.only(bottom: 20, left: 10, right: 10),
    ));
  }
}
