import 'package:flutter/material.dart';
import 'package:free_books/models/book.dart';
import 'package:free_books/screens/book_detail.dart';

class CardHorizontal extends StatelessWidget {
  const CardHorizontal({super.key, required this.book});
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
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xffEDEEEE),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                book.formats.imageJpeg,
                height: 70,
                width: 50,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      book.title,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Text(
                    book.authors.map((e) => e.name).join(', '),
                    style: TextStyle(color: Color(0xFF919CAC)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
