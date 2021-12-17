import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final bool showProgress;
  final String title;
  final Color? color;
  final Color? textColor;

  AppButton(
      {this.onPressed,
      required this.title,
      this.showProgress = false,
      this.color,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return MaterialButton(
      disabledColor: Colors.grey.withOpacity(0.8),
      onPressed: onPressed,
      child: showProgress
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              title,
              style: TextStyle(
                  fontSize: 15,
                  //  fontFamily: 'SFUIDisplay',
                  fontWeight: FontWeight.bold,
                  color: textColor ?? Colors.white),
            ),
      color: color ?? primaryColor,
      elevation: 0,
      minWidth: 270,
      height: 55,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    );
  }
}
