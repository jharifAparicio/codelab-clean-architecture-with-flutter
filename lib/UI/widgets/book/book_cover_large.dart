import 'package:flutter/material.dart';

class BookCoverLarge extends StatelessWidget {
  final String imageUrl;

  const BookCoverLarge({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final hasCover =
        imageUrl.isNotEmpty && (Uri.tryParse(imageUrl)?.hasScheme ?? false);

    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.3,
      color: const Color(0xffEDEEEE),
      child: hasCover
          ? Image.network(
              imageUrl,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const _CoverFallback(),
            )
          : const _CoverFallback(),
    );
  }
}

class _CoverFallback extends StatelessWidget {
  const _CoverFallback();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      alignment: Alignment.center,
      child: const Icon(Icons.book, size: 40),
    );
  }
}
