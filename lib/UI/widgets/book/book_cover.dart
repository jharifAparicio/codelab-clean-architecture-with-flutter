import 'package:flutter/material.dart';

class BookCover extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  const BookCover({
    super.key,
    required this.imageUrl,
    this.height = 200,
    this.width = 150,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xffEDEEEE),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.network(
        imageUrl,
        height: height,
        width: width,
        fit: BoxFit.fill,
      ),
    );
  }
}
