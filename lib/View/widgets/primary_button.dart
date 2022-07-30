import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:secure/Const/colors.dart';
import 'package:secure/View/widgets/textstyle.dart';

class AppPrimaryButton extends StatelessWidget {
  final onTap;
  final text;
  const AppPrimaryButton({Key? key, required this.onTap, required this.text})
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
        onPressed: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Button Tapped")));
        });
  }
}
