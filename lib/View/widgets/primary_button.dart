import 'package:flutter/material.dart';
import 'package:secure/Const/colors.dart';
import 'package:secure/View/widgets/textstyle.dart';

class AppPrimaryButton extends StatelessWidget {
  Function()? onTap;
  final text;
  AppPrimaryButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: AppColor.primary,
        child: Text(
          text,
          style: buttonStyle,
        ),
        onPressed: onTap);
  }
}
