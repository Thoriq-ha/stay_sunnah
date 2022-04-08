// To parse this JSON data, do
//
//     final quote = quoteFromJson(jsonString);

import 'dart:convert';

Quote quoteFromJson(String str) => Quote.fromJson(json.decode(str));

String quoteToJson(Quote data) => json.encode(data.toJson());

class Quote {
  Quote({
    required this.textEn,
    required this.textId,
    required this.author,
  });

  String textEn;
  String textId;
  String author;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        textEn: json["text_en"],
        textId: json["text_id"],
        author: json["author"],
      );

  Map<String, dynamic> toJson() => {
        "text_en": textEn,
        "text_id": textId,
        "author": author,
      };
}
