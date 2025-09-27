import 'package:flutter/material.dart';
import 'package:free_books/Domain/entities/book.dart';
import 'package:free_books/UI/screens/books/book_detail.dart';
import 'package:free_books/UI/widgets/book/book_cover.dart';
import 'package:free_books/UI/widgets/book/book_title.dart';
import 'package:free_books/UI/widgets/book/book_author.dart';

class CardVertical extends StatelessWidget {
  final Book book;

  const CardVertical({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => BookDetail(book: book)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        constraints: const BoxConstraints(maxWidth: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookCover(
              imageUrl: book.formats.imageJpeg,
              height: 200,
              width: 150,
            ),
            const SizedBox(height: 5),
            BookTitle(book.title),
            BookAuthor(book.authors.map((e) => e.name).join(', ')),
          ],
        ),
      ),
    );
  }
}
