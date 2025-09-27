import 'package:flutter/material.dart';
import 'package:flutter_epub_viewer/flutter_epub_viewer.dart';
import 'package:free_books/UI/widgets/Reader/read_progress.dart';
import 'dart:io';

class BookReader extends StatefulWidget {
  const BookReader({super.key, required this.title, required this.localFile});
  final String title;
  final File localFile;

  @override
  State<BookReader> createState() => _BookReaderState();
}

class _BookReaderState extends State<BookReader> {
  final epubController = EpubController();
  var textSelectionCfi = '';
  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          ReaderProgress(progress: progress),
          Expanded(
            child: EpubViewer(
              epubSource: EpubSource.fromFile(widget.localFile),
              epubController: epubController,
              displaySettings: EpubDisplaySettings(
                flow: EpubFlow.paginated,
                snap: true,
                theme: EpubTheme.light(),
                allowScriptedContent: true,
              ),
              onRelocated: (value) {
                setState(() => progress = value.progress);
              },
              onTextSelected: (sel) => textSelectionCfi = sel.selectionCfi,
            ),
          ),
        ],
      ),
    );
  }
}
