import 'package:flutter/material.dart';

class BookGenres extends StatelessWidget {
  final String genres;

  const BookGenres({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Genres',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(genres),
      ],
    );
  }
}
