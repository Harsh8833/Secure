import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secure/View/widgets/back_button.dart';
import 'package:secure/View/widgets/primary_button.dart';
import 'package:secure/View/widgets/textstyle.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({Key? key}) : super(key: key);

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
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: totalHeight * 0.08),
                    height: totalHeight * 0.5,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(40)),
                    child: Hero(
                      tag: "booktile",
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset("assets/book.jpg")),
                    ),
                  ),
                ),
                const AppBackButton()
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "The Kings of Drugs",
              style: bookTitleStyle,
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              "NORA BARRETT",
              style: autherStyle,
            ),
            AppPrimaryButton(onTap: () {}, text: "Read"),
            const Text("")
          ],
        )),
      ),
    );
  }
}
