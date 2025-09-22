import 'package:flutter/material.dart';
import 'package:free_books/models/book.dart';
import 'package:free_books/screens/book_reader.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({super.key, required this.book});
  final Book book;
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
                book.formats.imageJpeg,
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
                    book.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    book.authors.map((e) => e.name).join('\n'),
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Genres",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    book.bookshelves.isNotEmpty
                        ? book.bookshelves
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
                    book.summaries.isNotEmpty
                        ? book.summaries.join('\n\n')
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookReader(
                              title: book.title,
                              url: book.formats.applicationEpubZip,
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
