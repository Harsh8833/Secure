import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secure/Const/colors.dart';
import 'package:secure/Controller/books.dart';
import 'package:secure/Model/book_model.dart';
import 'package:secure/View/widgets/book_tile.dart';
import 'package:secure/View/widgets/snackbar.dart';
import 'package:secure/View/widgets/textstyle.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _booksController = BooksController();
  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    final totalHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            var _status = await _booksController.fetchBooks(context);
            if (!mounted) {}
            if (_status == 0) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(appSnackBar("Success"));
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(appSnackBar("Something went wrong"));
            }

            List<BookModel> _books = _booksController.getBookList();

            print(_books);
          },
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(28, 18, 0, 0),
                    child: Text(
                      "Books",
                      style: heading,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 18, 28, 0),
                    child: Icon(
                      Icons.search,
                      color: AppColor.primary,
                    ),
                  )
                ],
              ),
              Image.asset("assets/home_bg.png"),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                child: Text(
                  "Category 1",
                  style: heading,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 14,
                    ),
                    for (int i = 0; i < 10; i++) ...[
                      const SizedBox(
                        width: 2,
                      ),
                      const BookTile(
                          img: "assets/book.jpg", title: "Hypocrate world")
                    ],
                    const SizedBox(
                      width: 4,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 22, 0, 8),
                child: Text(
                  "Category 2",
                  style: heading,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 14,
                    ),
                    for (int i = 0; i < 10; i++) ...[
                      const SizedBox(
                        width: 2,
                      ),
                      const BookTile(
                          img: "assets/book.jpg", title: "Hypocrate world")
                    ],
                    const SizedBox(
                      width: 4,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
