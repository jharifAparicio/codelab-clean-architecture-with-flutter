import 'dart:convert';

import '../../Domain/entities/book.dart';

ApiResponseModel apiResponseFromJson(String str) =>
    ApiResponseModel.fromJson(json.decode(str));

String apiResponseToJson(ApiResponseModel data) => json.encode(data.toJson());

class ApiResponseModel {
  int count;
  String? next;
  String? previous;
  List<BookModel> results;

  ApiResponseModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  ApiResponseModel copyWith({
    int? count,
    String? next,
    String? previous,
    List<BookModel>? results,
  }) => ApiResponseModel(
    count: count ?? this.count,
    next: next ?? this.next,
    previous: previous ?? this.previous,
    results: results ?? this.results,
  );

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) =>
      ApiResponseModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<BookModel>.from(
          json["results"].map((x) => BookModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class BookModel {
  int id;
  String title;
  List<AuthorModel> authors;
  List<String> summaries;
  List<AuthorModel> translators;
  List<String> subjects;
  List<String> bookshelves;
  bool copyright;
  String mediaType;
  FormatsModel formats;
  int downloadCount;

  BookModel({
    required this.id,
    required this.title,
    required this.authors,
    required this.summaries,
    required this.translators,
    required this.subjects,
    required this.bookshelves,
    required this.copyright,
    required this.mediaType,
    required this.formats,
    required this.downloadCount,
  });

  BookModel copyWith({
    int? id,
    String? title,
    List<AuthorModel>? authors,
    List<String>? summaries,
    List<AuthorModel>? translators,
    List<String>? subjects,
    List<String>? bookshelves,
    bool? copyright,
    String? mediaType,
    FormatsModel? formats,
    int? downloadCount,
  }) => BookModel(
    id: id ?? this.id,
    title: title ?? this.title,
    authors: authors ?? this.authors,
    summaries: summaries ?? this.summaries,
    translators: translators ?? this.translators,
    subjects: subjects ?? this.subjects,
    bookshelves: bookshelves ?? this.bookshelves,
    copyright: copyright ?? this.copyright,
    mediaType: mediaType ?? this.mediaType,
    formats: formats ?? this.formats,
    downloadCount: downloadCount ?? this.downloadCount,
  );

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
    id: json["id"],
    title: json["title"],
    authors: List<AuthorModel>.from(
      json["authors"].map((x) => AuthorModel.fromJson(x)),
    ),
    summaries: List<String>.from(json["summaries"].map((x) => x)),
    translators: List<AuthorModel>.from(
      json["translators"].map((x) => AuthorModel.fromJson(x)),
    ),
    subjects: List<String>.from(json["subjects"].map((x) => x)),
    bookshelves: List<String>.from(json["bookshelves"].map((x) => x)),
    // languages: List<Language>.from(
    //   json["languages"].map((x) => languageValues.map[x]!),
    // ),
    copyright: json["copyright"],
    mediaType: json["media_type"],
    formats: FormatsModel.fromJson(json["formats"]),
    downloadCount: json["download_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "authors": List<dynamic>.from(authors.map((x) => x.toJson())),
    "summaries": List<dynamic>.from(summaries.map((x) => x)),
    "translators": List<dynamic>.from(translators.map((x) => x.toJson())),
    "subjects": List<dynamic>.from(subjects.map((x) => x)),
    "bookshelves": List<dynamic>.from(bookshelves.map((x) => x)),
    "copyright": copyright,
    "media_type": mediaType,
    "formats": formats.toJson(),
    "download_count": downloadCount,
  };
  Book toEntity() => Book(
    id: id,
    title: title,
    authors: authors.map((a) => a.toEntity()).toList(),
    summaries: summaries,
    translators: translators.map((a) => a.toEntity()).toList(),
    subjects: subjects,
    bookshelves: bookshelves,
    copyright: copyright,
    mediaType: mediaType,
    formats: formats.toEntity(),
    downloadCount: downloadCount,
  );
}

class AuthorModel {
  String? name;
  int? birthYear;
  int? deathYear;

  AuthorModel({
    required this.name,
    required this.birthYear,
    required this.deathYear,
  });

  AuthorModel copyWith({String? name, int? birthYear, int? deathYear}) =>
      AuthorModel(
        name: name ?? this.name,
        birthYear: birthYear ?? this.birthYear,
        deathYear: deathYear ?? this.deathYear,
      );

  factory AuthorModel.fromJson(Map<String, dynamic> json) => AuthorModel(
    name: json["name"],
    birthYear: json["birth_year"],
    deathYear: json["death_year"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "birth_year": birthYear,
    "death_year": deathYear,
  };
  Author toEntity() =>
      Author(name: name, birthYear: birthYear, deathYear: deathYear);
}

class FormatsModel {
  String? textHtml;
  String? applicationEpubZip;
  String? applicationXMobipocketEbook;
  String? textPlainCharsetUsAscii;
  String? applicationRdfXml;
  String imageJpeg;
  String? applicationOctetStream;
  String? textHtmlCharsetUtf8;
  String? textPlainCharsetUtf8;

  FormatsModel({
    required this.textHtml,
    required this.applicationEpubZip,
    required this.applicationXMobipocketEbook,
    required this.textPlainCharsetUsAscii,
    required this.applicationRdfXml,
    required this.imageJpeg,
    required this.applicationOctetStream,
    this.textHtmlCharsetUtf8,
    this.textPlainCharsetUtf8,
  });

  FormatsModel copyWith({
    String? textHtml,
    String? applicationEpubZip,
    String? applicationXMobipocketEbook,
    String? textPlainCharsetUsAscii,
    String? applicationRdfXml,
    String? imageJpeg,
    String? applicationOctetStream,
    String? textHtmlCharsetUtf8,
    String? textPlainCharsetUtf8,
  }) => FormatsModel(
    textHtml: textHtml ?? this.textHtml,
    applicationEpubZip: applicationEpubZip ?? this.applicationEpubZip,
    applicationXMobipocketEbook:
        applicationXMobipocketEbook ?? this.applicationXMobipocketEbook,
    textPlainCharsetUsAscii:
        textPlainCharsetUsAscii ?? this.textPlainCharsetUsAscii,
    applicationRdfXml: applicationRdfXml ?? this.applicationRdfXml,
    imageJpeg: imageJpeg ?? this.imageJpeg,
    applicationOctetStream:
        applicationOctetStream ?? this.applicationOctetStream,
    textHtmlCharsetUtf8: textHtmlCharsetUtf8 ?? this.textHtmlCharsetUtf8,
    textPlainCharsetUtf8: textPlainCharsetUtf8 ?? this.textPlainCharsetUtf8,
  );

  factory FormatsModel.fromJson(Map<String, dynamic> json) => FormatsModel(
    textHtml: json["text/html"],
    applicationEpubZip: json["application/epub+zip"],
    applicationXMobipocketEbook: json["application/x-mobipocket-ebook"],
    textPlainCharsetUsAscii: json["text/plain; charset=us-ascii"],
    applicationRdfXml: json["application/rdf+xml"],
    imageJpeg: json["image/jpeg"],
    applicationOctetStream: json["application/octet-stream"],
    textHtmlCharsetUtf8: json["text/html; charset=utf-8"],
    textPlainCharsetUtf8: json["text/plain; charset=utf-8"],
  );

  Map<String, dynamic> toJson() => {
    "text/html": textHtml,
    "application/epub+zip": applicationEpubZip,
    "application/x-mobipocket-ebook": applicationXMobipocketEbook,
    "text/plain; charset=us-ascii": textPlainCharsetUsAscii,
    "application/rdf+xml": applicationRdfXml,
    "image/jpeg": imageJpeg,
    "application/octet-stream": applicationOctetStream,
    "text/html; charset=utf-8": textHtmlCharsetUtf8,
    "text/plain; charset=utf-8": textPlainCharsetUtf8,
  };

  Formats toEntity() => Formats(
    textHtml: textHtml,
    applicationEpubZip: applicationEpubZip,
    applicationXMobipocketEbook: applicationXMobipocketEbook,
    textPlainCharsetUsAscii: textPlainCharsetUsAscii,
    applicationRdfXml: applicationRdfXml,
    imageJpeg: imageJpeg,
    applicationOctetStream: applicationOctetStream,
    textHtmlCharsetUtf8: textHtmlCharsetUtf8,
    textPlainCharsetUtf8: textPlainCharsetUtf8,
  );
}
