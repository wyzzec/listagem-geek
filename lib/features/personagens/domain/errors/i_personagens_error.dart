abstract class IPersonagensError {
  String? message;
  StackTrace? stackTrace;

  IPersonagensError({
    this.message,
    this.stackTrace,
  });
}