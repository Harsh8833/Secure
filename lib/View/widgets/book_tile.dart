import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secure/Const/colors.dart';
import 'package:secure/View/book_detail_page.dart';
import 'package:secure/View/widgets/textstyle.dart';

class BookTile extends StatelessWidget {
  final title;
  final img;
  final description;
  final auther;
  final pageCount;
  const BookTile(
      {Key? key,
      required this.title,
      required this.img,
      required this.description,
      required this.auther,
      required this.pageCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookDetailPage(
                      img: img,
                      title: title,
                      description: description,
                      auther: auther,
                      pageCount: pageCount,
                    )));
      }),
      child: SizedBox(
        width: 140,
        child: Card(
          borderOnForeground: true,
          color: AppColor.primary.withOpacity(0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0.0,
          child: Column(children: [
            Container(
                width: 115,
                height: 150,
                margin: const EdgeInsets.only(top: 8),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(img))),
            SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Text(
                  title,
                  maxLines: 3,
                  style: cardStyle,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
