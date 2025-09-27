enum BookFormat { epub, htmlZip, txt }

class DownloadResult {
  final String localPath;
  final BookFormat format;
  const DownloadResult(this.localPath, this.format);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DownloadResult &&
          localPath == other.localPath &&
          format == other.format;

  @override
  int get hashCode => Object.hash(localPath, format);
}
