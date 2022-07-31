import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:secure/Const/api_endpoint.dart';
import 'package:secure/Model/book_model.dart';
import 'package:secure/View/widgets/snackbar.dart';

class BooksController {
  List<BookModel> _fictionBookList = [];

  Future<Object> fetchBooks(apiEndpoint) async {
    try {
      var response = await http.get(Uri.parse(apiEndpoint));
      if (response.statusCode == 200) {
        _fictionBookList.clear();
        final items = jsonDecode(response.body)['items'];
        for (var each in items) {
          _fictionBookList.add(BookModel.fromJson(each));
        }
        print(_fictionBookList);
        return _fictionBookList;
      } else {
        log(response.statusCode.toString());
        return 1;
      }
    } catch (e) {
      log("Unable to fetch data$e");
      return 1;
    }
  }
}
