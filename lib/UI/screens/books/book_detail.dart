import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_books/Core/di/service_locator.dart';
import 'package:free_books/Domain/entities/book.dart';
import 'package:free_books/Infrastructure/download/download_cubit.dart';
import 'package:free_books/UI/widgets/book/book_actions.dart';
import 'package:free_books/UI/widgets/book/book_cover_large.dart';
import 'package:free_books/UI/widgets/book/book_genres.dart';
import 'package:free_books/UI/widgets/book/book_info.dart';
import 'package:free_books/UI/widgets/book/book_summary.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({super.key, required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<DownloadCubit>(),
      child: _BookDetailView(book: book),
    );
  }
}

class _BookDetailView extends StatelessWidget {
  const _BookDetailView({required this.book});
  final Book book;

  @override
  Widget build(BuildContext context) {
    final authors = book.authors.isNotEmpty
        ? book.authors.map((e) => e.name ?? 'Unknown').join('\n')
        : 'Unknown';

    final shelves = book.bookshelves.isNotEmpty
        ? book.bookshelves.map((e) => e.replaceAll('Category: ', '')).join('\n')
        : 'N/A';

    final summary = book.summaries.isNotEmpty
        ? book.summaries.join('\n\n')
        : 'N/A';

    final epubUrl = book.formats.applicationEpubZip ?? '';

    return Scaffold(
      appBar: AppBar(title: const Text('Book Detail')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookCoverLarge(imageUrl: book.formats.imageJpeg),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BookInfo(title: book.title, authors: authors),
                  const SizedBox(height: 16),
                  BookGenres(genres: shelves),
                  const SizedBox(height: 16),
                  BookSummary(summary: summary),
                  const SizedBox(height: 20),
                  BookActions(
                    epubUrl: epubUrl,
                    bookId: book.id,
                    title: book.title,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
