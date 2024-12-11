sealed class Result<T> {}

class Success<T> extends Result<T> {
  T data;

  Success({required this.data});
}

class ServerError<T> extends Result<T> {
  ServerErrorException serverErrorException;

  ServerError({required this.serverErrorException});
}

class Error<T> extends Result<T> {
  Exception exception;

  Error({required this.exception});
}

class ServerErrorException implements Exception {
  String statusMsg;
  String message;

  ServerErrorException({required this.statusMsg, required this.message});
}
