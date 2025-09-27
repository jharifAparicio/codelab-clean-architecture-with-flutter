abstract class FileDownloadRemoteDataSource {
  Future<void> downloadToPath({
    required Uri url,
    required String path,
    void Function(int received, int total)? onProgress,
  });
}
