import 'package:flutter/material.dart';
import 'package:flutter_epub_viewer/flutter_epub_viewer.dart';

class BookReader extends StatefulWidget {
  const BookReader({super.key, required this.title, required this.url});
  final String title;
  final String url;
  @override
  State<BookReader> createState() => _BookReaderState();
}

class _BookReaderState extends State<BookReader> {
  final epubController = EpubController();
  var textSelectionCfi = '';

  bool isLoading = true;
  @override
  void dispose() {
    super.dispose();
  }

  double progress = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.transparent,
          ),
          Expanded(
            child: Stack(
              children: [
                EpubViewer(
                  epubSource: EpubSource.fromUrl(
                    widget.url,
                    // cache: true,
                  ),
                  epubController: epubController,

                  displaySettings: EpubDisplaySettings(
                    flow: EpubFlow.paginated,
                    useSnapAnimationAndroid: false,
                    snap: true,
                    theme: EpubTheme.light(),
                    allowScriptedContent: true,
                  ),
                  selectionContextMenu: ContextMenu(
                    menuItems: [
                      ContextMenuItem(
                        title: "Highlight",
                        id: 1,
                        action: () async {
                          epubController.addHighlight(cfi: textSelectionCfi);
                        },
                      ),
                    ],
                    settings: ContextMenuSettings(
                      hideDefaultSystemContextMenuItems: true,
                    ),
                  ),
                  onChaptersLoaded: (chapters) {
                    setState(() {
                      isLoading = false;
                    });
                  },
                  onEpubLoaded: () async {},
                  onRelocated: (value) {
                    setState(() {
                      progress = value.progress;
                    });
                  },

                  onTextSelected: (epubTextSelection) {
                    textSelectionCfi = epubTextSelection.selectionCfi;
                  },
                ),
                // Visibility(
                //   visible: isLoading,
                //   child: const Center(child: CircularProgressIndicator()),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
