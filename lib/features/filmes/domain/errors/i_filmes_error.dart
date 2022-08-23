abstract class IFilmesError implements Exception {
  String? message;
  StackTrace? stackTrace;

  IFilmesError({
    this.message,
    this.stackTrace,
  });
}