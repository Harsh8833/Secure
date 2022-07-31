import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secure/View/book_detail_page.dart';
import 'package:secure/View/widgets/textstyle.dart';

class BookTile extends StatelessWidget {
  final title;
  final img;
  final description;
  final auther;
  const BookTile(
      {Key? key,
      required this.title,
      required this.img,
      required this.description,
      required this.auther})
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
                    )));
      }),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Column(children: [
          Container(
              height: 220,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12), child: img)),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Text(
              title,
              style: cardStyle,
            ),
          )
        ]),
      ),
    );
  }
}
