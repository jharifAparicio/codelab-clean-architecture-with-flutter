class Book {
  final int id;
  final String title;
  final List<Author> authors;
  final List<String> summaries;
  final List<Author> translators;
  final List<String> subjects;
  final List<String> bookshelves;
  final bool copyright;
  final String mediaType;
  final Formats formats;
  final int downloadCount;

  const Book({
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

  Book copyWith({
    int? id,
    String? title,
    List<Author>? authors,
    List<String>? summaries,
    List<Author>? translators,
    List<String>? subjects,
    List<String>? bookshelves,
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
    copyright: copyright ?? this.copyright,
    mediaType: mediaType ?? this.mediaType,
    formats: formats ?? this.formats,
    downloadCount: downloadCount ?? this.downloadCount,
  );
}

class Author {
  final String? name;
  final int? birthYear;
  final int? deathYear;

  const Author({
    required this.name,
    required this.birthYear,
    required this.deathYear,
  });

  Author copyWith({String? name, int? birthYear, int? deathYear}) => Author(
    name: name ?? this.name,
    birthYear: birthYear ?? this.birthYear,
    deathYear: deathYear ?? this.deathYear,
  );
}

class Formats {
  final String? textHtml;
  final String? applicationEpubZip;
  final String? applicationXMobipocketEbook;
  final String? textPlainCharsetUsAscii;
  final String? applicationRdfXml;
  final String imageJpeg;
  final String? applicationOctetStream;
  final String? textHtmlCharsetUtf8;
  final String? textPlainCharsetUtf8;

  const Formats({
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
}
