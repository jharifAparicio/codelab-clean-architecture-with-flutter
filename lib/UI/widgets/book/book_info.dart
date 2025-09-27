import 'package:flutter/material.dart';

class BookInfo extends StatelessWidget {
  final String title;
  final String authors;

  const BookInfo({super.key, required this.title, required this.authors});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Text(authors, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
