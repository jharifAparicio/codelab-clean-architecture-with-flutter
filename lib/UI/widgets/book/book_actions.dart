import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_books/Domain/value_objects/download_result.dart';
import 'package:free_books/Infrastructure/download/download_cubit.dart';
import 'package:free_books/UI/screens/books/book_reader.dart';

class BookActions extends StatelessWidget {
  final String epubUrl;
  final int bookId;
  final String title;

  const BookActions({
    super.key,
    required this.epubUrl,
    required this.bookId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final canDownload = epubUrl.isNotEmpty;

    return BlocBuilder<DownloadCubit, DownloadState>(
      builder: (context, state) {
        final downloading = state is DownloadInProgress;
        final percent = state is DownloadInProgress ? state.percent : 0.0;

        if (downloading) {
          return Column(
            children: [
              const Center(child: CircularProgressIndicator()),
              const SizedBox(height: 8),
              Text('download: ${percent.toStringAsFixed(0)}%'),
            ],
          );
        }

        return Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: !canDownload
                    ? null
                    : () async {
                        final cubit = context.read<DownloadCubit>();
                        await cubit.download(
                          url: epubUrl,
                          bookId: bookId.toString(),
                          chosen: BookFormat.epub,
                        );

                        final s = cubit.state;
                        if (context.mounted && s is DownloadSuccess) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  BookReader(title: title, localFile: s.file),
                            ),
                          );
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(300, 50),
                ),
                child: const Text('Read Book'),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton.icon(
                onPressed: !canDownload
                    ? null
                    : () async {
                        final cubit = context.read<DownloadCubit>();
                        await cubit.download(
                          url: epubUrl,
                          bookId: bookId.toString(),
                          chosen: BookFormat.epub,
                        );

                        final s = cubit.state;
                        if (context.mounted && s is DownloadSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Downloaded: ${s.file.path}'),
                            ),
                          );
                        }
                      },
                icon: const Icon(Icons.download),
                label: const Text('Download'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(300, 50),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
