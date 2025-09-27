import 'dart:io';

enum BookFormat { epub, htmlZip, txt }

class DownloadResult {
  final File file;
  final BookFormat format;
  DownloadResult(this.file, this.format);
}
