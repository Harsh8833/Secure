import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secure/Const/colors.dart';
import 'package:secure/View/widgets/back_button.dart';
import 'package:secure/View/widgets/primary_button.dart';
import 'package:secure/View/widgets/textstyle.dart';
import 'package:secure/View/widgets/pdf_viewer.dart';

class BookDetailPage extends StatelessWidget {
  final title;
  final img;
  final auther;
  final description;
  final pageCount;

  const BookDetailPage(
      {Key? key,
      required this.title,
      required this.img,
      required this.auther,
      required this.description,
      required this.pageCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    final totalHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Stack(
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
                SizedBox(
                  width: totalWidth,
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 70, 30, 0),
                  child: Text(
                    title,
                    style: wordArtBookTitle,
                    maxLines: 3,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: totalHeight,
                  width: totalWidth,
                ),
              ],
            ),
            SizedBox(
              height: totalHeight,
              width: totalWidth,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(children: [
                  SizedBox(
                    height: totalHeight * 0.2,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: totalWidth * 0.5,
                    height: totalHeight * 0.35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: AppColor.grey.withOpacity(0.5)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network(
                          img,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: bookTitleStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  if (auther != null) ...[
                    for (var i in auther) ...[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Text(
                          i ?? "Unknown",
                          style: autherStyle,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ],
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                    child: Text(
                      description ?? "N/a",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                    child: Text(
                      "$pageCount pages",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  AppPrimaryButton(
                      onTap: () {
                        print("Read");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AppPdfViewer(
                                    link:
                                        "https://books.googleusercontent.com/books/content?req=AKW5QafGwmyUPeArX4YG3o2EW5g1F9C524YxbhcSVIc_zX-oBa5aFxJ_YXiMsgGj1igUj1DAsuFvxtabuygD-p0sc4eftwjxb1RNizUZX8G6GR55lf6X4VXiq-dtAbPqkvA50Oq80aTPwQZFO1PlXNRf6KSQe31om8Dp5V-hBTZ3NYVmDitdUahVTD6Nwr_xHNCOZ3RnAGANuQff5bZPzXKuKiWvw_MX9kz_6513XSXUy5ygDNEEqSlC_VZlg9td4jUhptAO77i5")));
                      },
                      text: "Read"),
                  SizedBox(
                    height: totalHeight * 1,
                  ),
                ]),
              ),
            ),
            const AppBackButton()
          ],
        ),
      ),
    );
  }
}
