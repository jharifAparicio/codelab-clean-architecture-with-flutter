import 'dart:convert';

ApiResponse apiResponseFromJson(String str) =>
    ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  int count;
  String? next;
  String? previous;
  List<Book> results;

  ApiResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  ApiResponse copyWith({
    int? count,
    String? next,
    String? previous,
    List<Book>? results,
  }) => ApiResponse(
    count: count ?? this.count,
    next: next ?? this.next,
    previous: previous ?? this.previous,
    results: results ?? this.results,
  );

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Book>.from(json["results"].map((x) => Book.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Book {
  int id;
  String title;
  List<Author> authors;
  List<String> summaries;
  List<Author> translators;
  List<String> subjects;
  List<String> bookshelves;
  List<Language> languages;
  bool copyright;
  String mediaType;
  Formats formats;
  int downloadCount;

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.summaries,
    required this.translators,
    required this.subjects,
    required this.bookshelves,
    required this.languages,
    required this.copyright,
    required this.mediaType,
    required this.formats,
    required this.downloadCount,
  });

  Book copyWith({
    int? id,
    String? title,
    List<Author>? authors,
    List<String>? summaries,
    List<Author>? translators,
    List<String>? subjects,
    List<String>? bookshelves,
    List<Language>? languages,
    bool? copyright,
    String? mediaType,
    Formats? formats,
    int? downloadCount,
  }) => Book(
    id: id ?? this.id,
    title: title ?? this.title,
    authors: authors ?? this.authors,
    summaries: summaries ?? this.summaries,
    translators: translators ?? this.translators,
    subjects: subjects ?? this.subjects,
    bookshelves: bookshelves ?? this.bookshelves,
    languages: languages ?? this.languages,
    copyright: copyright ?? this.copyright,
    mediaType: mediaType ?? this.mediaType,
    formats: formats ?? this.formats,
    downloadCount: downloadCount ?? this.downloadCount,
  );

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    id: json["id"],
    title: json["title"],
    authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
    summaries: List<String>.from(json["summaries"].map((x) => x)),
    translators: List<Author>.from(
      json["translators"].map((x) => Author.fromJson(x)),
    ),
    subjects: List<String>.from(json["subjects"].map((x) => x)),
    bookshelves: List<String>.from(json["bookshelves"].map((x) => x)),
    languages: List<Language>.from(
      json["languages"].map((x) => languageValues.map[x]!),
    ),
    copyright: json["copyright"],
    mediaType: json["media_type"],
    formats: Formats.fromJson(json["formats"]),
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
    "languages": List<dynamic>.from(
      languages.map((x) => languageValues.reverse[x]),
    ),
    "copyright": copyright,
    "media_type": mediaType,
    "formats": formats.toJson(),
    "download_count": downloadCount,
  };
}

class Author {
  String? name;
  int? birthYear;
  int? deathYear;

  Author({
    required this.name,
    required this.birthYear,
    required this.deathYear,
  });

  Author copyWith({String? name, int? birthYear, int? deathYear}) => Author(
    name: name ?? this.name,
    birthYear: birthYear ?? this.birthYear,
    deathYear: deathYear ?? this.deathYear,
  );

  factory Author.fromJson(Map<String, dynamic> json) => Author(
    name: json["name"],
    birthYear: json["birth_year"],
    deathYear: json["death_year"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "birth_year": birthYear,
    "death_year": deathYear,
  };
}

class Formats {
  String? textHtml;
  String? applicationEpubZip;
  String? applicationXMobipocketEbook;
  String? textPlainCharsetUsAscii;
  String? applicationRdfXml;
  String imageJpeg;
  String? applicationOctetStream;
  String? textHtmlCharsetUtf8;
  String? textPlainCharsetUtf8;

  Formats({
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

  Formats copyWith({
    String? textHtml,
    String? applicationEpubZip,
    String? applicationXMobipocketEbook,
    String? textPlainCharsetUsAscii,
    String? applicationRdfXml,
    String? imageJpeg,
    String? applicationOctetStream,
    String? textHtmlCharsetUtf8,
    String? textPlainCharsetUtf8,
  }) => Formats(
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

  factory Formats.fromJson(Map<String, dynamic> json) => Formats(
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
}

enum Language { en, es, fr }

final languageValues = EnumValues({
  "en": Language.en,
  "es": Language.es,
  "fr": Language.fr,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
