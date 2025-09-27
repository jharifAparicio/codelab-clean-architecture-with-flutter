class AppServiceException implements Exception {
  final String message;
  final int? statusCode;
  final Object? cause;

  const AppServiceException(this.message, {this.statusCode, this.cause});

  @override
  String toString() =>
      'AppServiceException(statusCode: $statusCode, message: $message, cause: $cause)';
}
