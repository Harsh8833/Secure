import 'dart:convert';

BookModel bookModelFromJson(String str) => BookModel.fromJson(json.decode(str));

class BookModel {
  final id;
  final title;
  final subtitle;
  final authers;
  final pageCount;
  final thumbnail;

  BookModel(
      {this.title,
      this.subtitle,
      this.authers,
      this.pageCount,
      this.thumbnail,
      this.id});

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["id"],
        title: json["volumeInfo"]["title"],
        subtitle: json["volumeInfo"]["subtitle"],
        authers: json["volumeInfo"]["authors"] == null
            ? null
            : List<String>.from(json['volumeInfo']["authors"].map((x) => x)),
        pageCount: json["volumeInfo"]["pageCount"],
        thumbnail: json["volumeInfo"]["imageLinks"]["thumbnail"],
      );
}
