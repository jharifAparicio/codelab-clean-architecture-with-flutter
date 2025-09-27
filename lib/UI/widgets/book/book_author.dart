import 'package:flutter/material.dart';

class BookAuthor extends StatelessWidget {
  final String authors;

  const BookAuthor(this.authors, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      authors,
      maxLines: 2,
      style: const TextStyle(
        color: Color(0xFF919CAC),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
