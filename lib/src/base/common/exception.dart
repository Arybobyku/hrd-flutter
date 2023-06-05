/// Base class for application exceptions
abstract class AppException implements Exception {
  final dynamic data;
  final String prefix;

  AppException(
    this.data,
    this.prefix,
  );

  @override
  String toString() => "$prefix$data";
}

/// Default HTTP exception for undefined status error
class FetchDataException extends AppException {
  FetchDataException(data)
      : super(data, "[ERROR] Error During Communication: ");
}

/// HTTP exception for error status 400
class BadRequestException extends AppException {
  BadRequestException(data) : super(data, "[ERROR] Invalid Request: ");
}

/// HTTP exception for error status 401
class UnauthorizedException extends AppException {
  UnauthorizedException(data) : super(data, "[ERROR] Unauthorized: ");
}

/// HTTP exception for error status 402
class BadAuthException extends AppException {
  BadAuthException(data) : super(data, "[ERROR] Unauthorized: ");
}

/// HTTP exception for error status 403
class ForbiddenException extends AppException {
  ForbiddenException(data) : super(data, "[ERROR] Forbidden: ");
}

/// Exception for wrong input in forms
class InvalidInputException extends AppException {
  InvalidInputException(data) : super(data, "[ERROR] Invalid Input: ");
}

/// HTTP exception for error status 504 and request timeout
class TimeoutException extends AppException {
  TimeoutException(data) : super(data, "[ERROR] Connection Timeout: ");
}

/// HTTP exception for error status 503
class ServiceUnavailableException extends AppException {
  ServiceUnavailableException(data)
      : super(data, "[ERROR] Service Unavailable : ");
}

/// HTTP exception for error status 404 & 204
class NotFoundException extends AppException {
  NotFoundException(data) : super(data, "[ERROR] Not Found: ");
}

/// HTTP exception for error status 500
class InternalServerErrorException extends AppException {
  InternalServerErrorException(data)
      : super(data, "[ERROR] Internal Server Error: ");
}
