import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secure/View/book_detail_page.dart';
import 'package:secure/View/widgets/textstyle.dart';

class SearchBookTile extends StatelessWidget {
  final img;
  final title;
  final auther;
  final description;
  const SearchBookTile(
      {Key? key,
      required this.img,
      required this.auther,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BookDetailPage(
                      img: img,
                      title: title,
                      auther: auther,
                      description: description,
                    )));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Row(children: [
          Container(
              width: totalWidth * 0.27,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12), child: img)),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: heading,
                ),
                Text(
                  auther,
                  style: autherStyle,
                ),
                SizedBox(
                  width: totalWidth * 0.6,
                  child: Text(
                    description,
                    softWrap: true,
                    maxLines: 5,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
