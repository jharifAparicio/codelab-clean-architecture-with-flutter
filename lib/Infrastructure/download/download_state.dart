part of 'download_cubit.dart';

abstract class DownloadState {
  const DownloadState();
}

class DownloadIdle extends DownloadState {
  const DownloadIdle();
}

class DownloadInProgress extends DownloadState {
  final int received;
  final int total;
  const DownloadInProgress(this.received, this.total);

  double get percent => total > 0 ? (received / total * 100) : 0;
}

class DownloadSuccess extends DownloadState {
  final File file;
  final BookFormat chosen;
  const DownloadSuccess(this.file, this.chosen);
}

class DownloadFailure extends DownloadState {
  final String message;
  const DownloadFailure(this.message);
}
