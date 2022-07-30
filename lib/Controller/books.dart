import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:secure/Const/api_endpoint.dart';
import 'package:secure/Model/book_model.dart';
import 'package:secure/View/widgets/snackbar.dart';

class BooksController {
  List<BookModel> _bookList = [];

  List<BookModel> getBookList() {
    return _bookList;
  }

  Future<int> fetchBooks(ctx) async {
    try {
      var response = await http.get(Uri.parse(ApiEndpoint.BOOKS));
      if (response.statusCode == 200) {
        print(response.body);
        _bookList.clear();
        for (var each in jsonDecode(response.body)['items']) {
          _bookList.add(BookModel.fromJson(each));
        }
        return 0;
      } else {
        log(response.statusCode.toString());
        return 1;
      }
    } catch (e) {
      log("Unable to fetch data" + e.toString());
      return 1;
    }
  }
}
