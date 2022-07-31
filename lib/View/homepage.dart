import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secure/Const/colors.dart';
import 'package:secure/Controller/books.dart';
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
                      BookTile(
                        img: Image.asset("assets/book.jpg"),
                        title: "Hypocrate world",
                        auther: 'Jumanji kumar',
                        description:
                            "Proident fugiat aliqua est culpa Lorem nostrud laboris nulla commodo commodo. Eu do Lorem enim pariatur nulla occaecat occaecat ullamco. In nisi labore sint ipsum pariatur culpa deserunt pariatur exercitation consectetur est labore. Sunt exercitation sit nisi aliqua aliquip. Mollit aute culpa est dolor. Sint excepteur pariatur sint laboris nostrud. Veniam est occaecat enim exercitation tempor laboris veniam ex dolor.",
                      )
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
                  "Adventure",
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
                      BookTile(
                          auther: "Someone",
                          description:
                              "Velit sunt proident qui nulla exercitation officia aliqua quis. Est pariatur exercitation Lorem eiusmod ex commodo adipisicing proident irure consectetur magna dolore veniam. Enim incididunt eu eiusmod exercitation est laborum. Dolore ex eu reprehenderit consectetur deserunt est pariatur aute cupidatat. Irure est ipsum non dolore occaecat labore adipisicing esse incididunt amet.",
                          img: Image.asset("assets/book.jpg"),
                          title: "Hypocrate world")
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
                  "Sports",
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
                      BookTile(
                          auther: "Someone",
                          description:
                              "Cillum nisi tempor ea ex elit laborum nulla sunt deserunt nostrud sint. Ea fugiat ipsum mollit do duis dolor id occaecat ad minim aliquip labore sit. Irure consectetur ullamco in nisi consequat anim ullamco cillum labore culpa commodo amet pariatur eiusmod. Est ipsum est aliquip sit id voluptate culpa cillum nostrud. In elit voluptate dolore ut est tempor ex minim id qui ad mollit nulla. Sunt non esse excepteur aliquip labore incididunt veniam nostrud labore ea proident nostrud exercitation ullamco. Aliquip qui incididunt exercitation sunt magna magna anim nostrud amet deserunt nostrud.",
                          img: Image.asset("assets/book.jpg"),
                          title: "Hypocrate world")
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
                  "Health",
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
                      BookTile(
                          auther: "Someone",
                          description:
                              "Esse enim exercitation adipisicing labore. Est est pariatur sunt culpa est ipsum nisi exercitation mollit nulla nulla laborum ad anim. Magna occaecat laboris aliqua ut magna sunt cupidatat. Velit culpa labore non aliquip ut fugiat sunt et sunt eu commodo mollit dolore do. Esse duis excepteur adipisicing Lorem ea commodo exercitation laboris eiusmod culpa. Voluptate cupidatat pariatur cupidatat et pariatur deserunt enim nostrud sunt mollit eiusmod. Non consequat id sit est nulla ex eu velit.",
                          img: Image.asset("assets/book.jpg"),
                          title: "Hypocrate world")
                    ],
                    const SizedBox(
                      width: 4,
                    ),
                  ],
                ),
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
