import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secure/View/widgets/back_button.dart';
import 'package:secure/View/widgets/primary_button.dart';
import 'package:secure/View/widgets/textstyle.dart';

class BookDetailPage extends StatelessWidget {
  final title;
  final img;
  final auther;
  final description;

  const BookDetailPage(
      {Key? key,
      required this.title,
      required this.img,
      required this.auther,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    final totalHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                    top: -totalHeight * 0.1,
                    left: -totalWidth * 0.2,
                    child: SvgPicture.asset(
                      'assets/detail_bg.svg',
                      width: totalWidth * 1.2,
                    )),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: totalHeight * 0.08),
                    height: totalHeight * 0.5,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(40)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(40), child: img),
                  ),
                ),
                const AppBackButton()
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: bookTitleStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            if (auther != null) ...[
              for (var i in auther) ...[
                Text(
                  i ?? "Unknown",
                  style: autherStyle,
                )
              ],
            ],
            const SizedBox(
              height: 4,
            ),
            AppPrimaryButton(onTap: () {}, text: "Read"),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Text(
                description ?? "N/a",
                textAlign: TextAlign.justify,
              ),
            )
          ],
        )),
      ),
    );
  }
}
