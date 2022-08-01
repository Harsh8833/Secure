import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secure/Const/colors.dart';
import 'package:secure/View/widgets/search_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late FocusNode _searchFocusNode;
  @override
  void initState() {
    // TODO: implement initState
    _searchFocusNode = FocusNode();
    _searchFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final totalWidth = MediaQuery.of(context).size.width;
    final totalHeight = MediaQuery.of(context).size.height;
    TextEditingController _search = TextEditingController();
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 100,
            elevation: 0,
            backgroundColor: AppColor.white,
            floating: true,
            leading: const SizedBox(),
            flexibleSpace: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 50,
                  width: totalWidth * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.secondary.withOpacity(0.2),
                      border: Border.all(color: AppColor.white)),
                  child: TextFormField(
                    focusNode: _searchFocusNode,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColor.primary,
                        )),
                    controller: _search,
                    cursorHeight: 25,
                    style: const TextStyle(fontSize: 20),
                    onChanged: (value) {
                      print(_search.text);
                    },
                  ),
                )
              ],
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return const SearchBookTile(
                img:
                    "https://i0.wp.com/www.thebooksatchel.com/wp-content/uploads/2020/07/follow-me-to-the-ground.jpg?w=980&ssl=1",
                auther: "Sue Rainsford",
                title: "Follow Me To Ground",
                description:
                    "Commodo est labore tempor incididunt laborum laborum sunt adipisicing. Sit minim duis pariatur voluptate. Enim aliquip amet qui fugiat ex commodo sint sunt ea tempor et nulla deserunt et. Mollit id tempor excepteur sit eiusmod dolor. Esse sint duis voluptate ipsum velit irure est irure ad ea aliquip occaecat sit. Nostrud eu aute ullamco adipisicing.",
                pageCount: 200,
              );
            }, childCount: 7),
          ),
        ],
      )),
    );
  }
}
