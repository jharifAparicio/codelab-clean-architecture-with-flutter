import 'package:flutter/material.dart';

class CoverFallback extends StatelessWidget {
  const CoverFallback({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      alignment: Alignment.center,
      child: const Icon(Icons.book, size: 40),
    );
  }
}
