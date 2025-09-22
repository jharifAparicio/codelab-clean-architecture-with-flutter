import 'package:flutter/material.dart';
import 'package:free_books/models/book.dart';
import 'package:free_books/screens/book_detail.dart';

class CardVertical extends StatelessWidget {
  const CardVertical({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return BookDetail(book: book);
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        alignment: Alignment.topLeft,
        constraints: BoxConstraints(maxWidth: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xffEDEEEE),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                book.formats.imageJpeg,
                height: 200,
                width: 150,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              book.title,
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              book.authors.map((e) => e.name).join(', '),
              maxLines: 2,
              style: TextStyle(
                color: Color(0xFF919CAC),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
