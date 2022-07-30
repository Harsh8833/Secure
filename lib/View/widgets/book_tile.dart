import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secure/View/widgets/textstyle.dart';

class BookTile extends StatelessWidget {
  final title;
  final img;
  const BookTile({Key? key, required this.title, required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Column(children: [
        Container(
            height: 220,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(img))),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Text(
            title,
            style: cardStyle,
          ),
        )
      ]),
    );
  }
}
