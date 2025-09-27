import 'package:flutter/material.dart';
import 'package:free_books/Domain/entities/book.dart';
import 'package:free_books/UI/screens/books/book_detail.dart';
import 'package:free_books/UI/widgets/book/book_cover.dart';
import 'package:free_books/UI/widgets/book/book_title.dart';
import 'package:free_books/UI/widgets/book/book_author.dart';

class CardHorizontal extends StatelessWidget {
  final Book book;

  const CardHorizontal({super.key, required this.book});

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
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          children: [
            BookCover(imageUrl: book.formats.imageJpeg, height: 70, width: 50),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BookTitle(book.title),
                  BookAuthor(book.authors.map((e) => e.name).join(', ')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
