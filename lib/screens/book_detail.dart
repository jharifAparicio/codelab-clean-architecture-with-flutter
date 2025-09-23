import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:free_books/models/book.dart';
import 'package:free_books/models/download_result.dart';
import 'package:free_books/repository/guterber_downloader.dart';
import 'package:free_books/screens/book_reader.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({super.key, required this.book});
  final Book book;

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book Detail")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.3,
              decoration: BoxDecoration(color: Color(0xffEDEEEE)),
              child: Image.network(
                widget.book.formats.imageJpeg,
                width: 400,
                height: 400,
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.book.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.book.authors.map((e) => e.name).join('\n'),
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Genres",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.book.bookshelves.isNotEmpty
                        ? widget.book.bookshelves
                              .map((e) => e.replaceAll("Category: ", ""))
                              .join('\n')
                        : 'N/A',
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Summary",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    widget.book.summaries.isNotEmpty
                        ? widget.book.summaries.join('\n\n')
                        : 'N/A',
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        maximumSize: Size(300, 50),
                        minimumSize: Size(300, 50),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      onPressed: () async {
                        if (widget.book.formats.applicationEpubZip == null) {
                          return;
                        }

                        final dl = GutenbergDownloader();
                        final result = await dl.downloadBest(
                          url: widget
                              .book
                              .formats
                              .applicationEpubZip!, // tu JSON "formats"
                          bookId: widget.book.id.toString(),
                          chosen: BookFormat.epub,
                          onProgress: (r, t) {
                            if (kDebugMode) {
                              print(
                                'download: ${(r / t * 100).toStringAsFixed(0)}%',
                              );
                            }
                          },
                        );
                        if (!context.mounted) return;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookReader(
                              title: widget.book.title,
                              localFile: result.file,
                            ),
                          ),
                        );
                      },
                      child: Text("Read Book"),
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlueAccent,
                        foregroundColor: Colors.white,
                        maximumSize: Size(300, 50),
                        minimumSize: Size(300, 50),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.download),
                      label: Text("Download"),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
