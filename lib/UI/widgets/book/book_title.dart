import 'package:flutter/material.dart';

class BookTitle extends StatelessWidget {
  final String title;

  const BookTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
