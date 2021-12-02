class ErrorNoticiaException implements Exception {
  String message;
  StackTrace stackTrace;
  ErrorNoticiaException(this.message,this.stackTrace);
}