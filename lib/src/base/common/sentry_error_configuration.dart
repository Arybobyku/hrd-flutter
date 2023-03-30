

import 'exception.dart';

/// Representing error configuration that you want to record.
///
/// By default all the exception is enabled
class SentryErrorConfiguration {
  /// Enable [FetchDataException] logging
  final bool? fetchDataException;

  /// Enable [BadRequestException] logging
  final bool? badRequestException;

  /// Enable [UnauthorizedException] logging
  final bool? unauthorizedException;

  /// Enable [ForbiddenException] logging
  final bool? forbiddenException;

  /// Enable [InvalidInputException] logging
  final bool? invalidInputException;

  /// Enable [TimeoutException] logging
  final bool? timeoutException;

  /// Enable [ServiceUnavailableException] logging
  final bool? serviceUnavailableException;

  /// Enable [NotFoundException] logging
  final bool? notFoundException;

  /// Enable [InternalServerErrorException] logging
  final bool? internalServerErrorException;

  /// Enable [BlocBadErrorStateException] logging
  final bool? blocBadErrorStateException;
  SentryErrorConfiguration({
    this.fetchDataException = true,
    this.badRequestException = true,
    this.unauthorizedException = true,
    this.forbiddenException = true,
    this.invalidInputException = true,
    this.timeoutException = true,
    this.serviceUnavailableException = true,
    this.notFoundException = true,
    this.internalServerErrorException = true,
    this.blocBadErrorStateException = true,
  });

  factory SentryErrorConfiguration.fromJson(Map<String, bool> map) =>
      SentryErrorConfiguration(
        badRequestException: map['badRequestException'],
        blocBadErrorStateException: map['blocBadErrorStateException'],
        fetchDataException: map['fetchDataException'],
        forbiddenException: map['forbiddenException'],
        internalServerErrorException: map['internalServerErrorException'],
        invalidInputException: map['invalidInputException'],
        notFoundException: map['notFoundException'],
        serviceUnavailableException: map['serviceUnavailableException'],
        timeoutException: map['timeoutException'],
        unauthorizedException: map['unauthorizedException'],
      );

  /// [FetchDataException] validation
  bool fetchDataValidation(dynamic exception) {
    if (fetchDataException == true && exception is FetchDataException) {
      return true;
    }

    return false;
  }

  /// [BadRequestException] validation
  bool badRequestValidation(dynamic exception) {
    if (badRequestException == true && exception is BadRequestException) {
      return true;
    }

    return false;
  }

  /// [UnauthorizedException] validation
  bool unauthorizedValidation(dynamic exception) {
    if (unauthorizedException == true && exception is UnauthorizedException) {
      return true;
    }

    return false;
  }

  /// [ForbiddenException] validation
  bool forbiddenValidation(dynamic exception) {
    if (forbiddenException == true && exception is ForbiddenException) {
      return true;
    }

    return false;
  }

  /// [InvalidInputException] validation
  bool invalidInputValidation(dynamic exception) {
    if (invalidInputException == true && exception is InvalidInputException) {
      return true;
    }

    return false;
  }

  /// [TimeoutException] validation
  bool timeoutValidation(dynamic exception) {
    if (timeoutException == true && exception is TimeoutException) {
      return true;
    }

    return false;
  }

  /// [ServiceUnavailableException] validation
  bool serviceUnavailableValidation(dynamic exception) {
    if (serviceUnavailableException == true &&
        exception is ServiceUnavailableException) {
      return true;
    }

    return false;
  }

  /// [NotFoundException] validation
  bool notFoundValidation(dynamic exception) {
    if (notFoundException == true && exception is NotFoundException) {
      return true;
    }

    return false;
  }

  /// [InternalServerErrorException] validation
  bool internalServerErrorValidation(dynamic exception) {
    if (internalServerErrorException == true &&
        exception is InternalServerErrorException) {
      return true;
    }

    return false;
  }

  /// [BlocBadErrorStateException] validation
  bool blocBadErrorStateValidation(dynamic exception) {
    if (blocBadErrorStateException == true &&
        exception is StateError &&
        exception.message
            .toString()
            .contains('Cannot emit new states after calling close')) {
      return true;
    }

    return false;
  }
}
