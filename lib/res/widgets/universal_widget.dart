import 'package:flutter/material.dart';


///////////////////////Loading Button////////////////
Widget primaryButtonLoading({
  context,
  required Widget passButtonText,
  required onTap,
  var passBorder,
  var passcircularIndicator,
  required Color? passButtonColor,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(
        vertical: 13,
      ),
      decoration: BoxDecoration(
          color: passButtonColor,
          border: passBorder,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          )),
      child: Center(
        child: passButtonText,
      ),
    ),
  );
}

///////////////////////Circular Indicator////////////////
Widget customcircularprogress({
  Color? passcolor,
  BuildContext? context,
  double? passsize,
}) {
  return SizedBox(
    height: passsize ?? 20,
    width: passsize ?? 20,
    child: Center(
      child: CircularProgressIndicator(
        color: passcolor ?? Theme.of(context!).primaryColorLight,
      ),
    ),
  );
}


///////////////////////No Data Found////////////////
Widget noDataFound(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Text(
        'No Data Found',
        style: TextStyle(
          color: Theme.of(context).primaryColorLight,
        ),
      ),
    ),
  );
}

///////////////////////Line widget////////////////
Widget bottomLine({double? width, double? height, context, Color? passcolor}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      color: passcolor ?? Theme.of(context).hintColor,
    ),
  );
}