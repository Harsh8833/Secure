import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secure/Const/api_endpoint.dart';
import 'package:secure/Const/colors.dart';
import 'package:secure/Controller/books_controller.dart';
import 'package:secure/Model/book_model.dart';
import 'package:secure/View/search_page.dart';
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(28, 18, 0, 0),
                    child: Text(
                      "Books",
                      style: heading,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 18, 28, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchPage()));
                      },
                      child: const Icon(
                        Icons.search,
                        color: AppColor.primary,
                      ),
                    ),
                  )
                ],
              ),
              Image.asset("assets/home_bg.png"),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
                child: Text(
                  "Fiction",
                  style: heading,
                ),
              ),
              ShowBooks(
                booksController: _booksController,
                future: _booksController.fetchBooks(ApiEndpoint.FICTION_BOOKS),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 22, 0, 8),
                child: Text(
                  "Adventure",
                  style: heading,
                ),
              ),
              ShowBooks(
                booksController: _booksController,
                future:
                    _booksController.fetchBooks(ApiEndpoint.ADVENTURE_BOOKS),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 22, 0, 8),
                child: Text(
                  "Sports",
                  style: heading,
                ),
              ),
              ShowBooks(
                booksController: _booksController,
                future: _booksController.fetchBooks(ApiEndpoint.SPORTS_BOOKS),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 22, 0, 8),
                child: Text(
                  "Sports",
                  style: heading,
                ),
              ),
              ShowBooks(
                booksController: _booksController,
                future: _booksController.fetchBooks(ApiEndpoint.HEALTH_BOOKS),
              ),
              const SizedBox(
                height: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShowBooks extends StatelessWidget {
  const ShowBooks(
      {Key? key,
      required BooksController booksController,
      required this.future})
      : _booksController = booksController,
        super(key: key);

  final BooksController _booksController;
  final Future<Object> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              var data = snapshot.data as List<BookModel>;
              print(data[0]);
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 14,
                    ),
                    for (int i = 0; i < data.length; i++) ...[
                      const SizedBox(
                        width: 2,
                      ),
                      BookTile(
                        img: Image.network(data[i].thumbnail),
                        title: data[i].title,
                        auther: data[i].authers,
                        description: data[i].subtitle,
                      )
                    ],
                    const SizedBox(
                      width: 4,
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} occurred',
                style: const TextStyle(fontSize: 18),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.primary,
              ),
            );
          }
        }));
  }
}
