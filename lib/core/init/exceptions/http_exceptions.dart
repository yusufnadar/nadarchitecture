// to control http exception

class HttpException implements Exception {
  final String? _message;
  final String? _prefix;

  HttpException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix|$_message';
  }
}

class FetchDataException extends HttpException {
  FetchDataException([String? message])
      : super(message, "Error During Communication");
}

class BadRequestException extends HttpException {
  BadRequestException([message]) : super(message, "Invalid Request");
}

class UnauthorisedException extends HttpException {
  UnauthorisedException([message]) : super(message, "Unauthorised");
}

class InvalidInputException extends HttpException {
  InvalidInputException([String? message]) : super(message, "Invalid Input");
}
    