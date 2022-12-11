import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

// ! to use this Error Handler
// ! that can handle any Exeption we throw it or coming from dio
// catch(error) {return ErrorHandler.handle(error).failure}
// ! or we can return Failure Type by use
// DataSourceError.errorType.getFailure;

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // ! dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    }
    //!  to handle any error source
    else if (error is DataSourceError) {
      failure = error.getFailure();
    } else {
      failure = DataSourceError.other.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataSourceError.connectTimeout.getFailure();
    case DioErrorType.sendTimeout:
      return DataSourceError.sendTimeout.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSourceError.receiveTimeout.getFailure();
    case DioErrorType.response:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? "");
      } else {
        return DataSourceError.other.getFailure();
      }
    case DioErrorType.cancel:
      return DataSourceError.cancel.getFailure();
    case DioErrorType.other:
      return DataSourceError.other.getFailure();
  }
}

// ! here we need to add all error source that can face us
// ! and we can throw it as Execption
enum DataSourceError implements Exception {
  success,
  noContent,
  badRequest,
  forbidden,
  unAuthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInterntConnection,
  serverError,
  cachedError,
  invalidInput,
  other
}

extension DataSourceExtension on DataSourceError {
  Failure getFailure() {
    switch (this) {
      case DataSourceError.success:
        return Failure(ResponseCode.success, "");
      case DataSourceError.noContent:
        return Failure(ResponseCode.noContent, "");
      case DataSourceError.badRequest:
        return Failure(ResponseCode.badRequest, "");
      case DataSourceError.forbidden:
        return Failure(ResponseCode.forbidden, "");
      case DataSourceError.unAuthorised:
        return Failure(ResponseCode.unAuthorised, "");
      case DataSourceError.notFound:
        return Failure(ResponseCode.notFound, "");
      case DataSourceError.internalServerError:
        return Failure(ResponseCode.internalServerError, "");
      case DataSourceError.connectTimeout:
        return Failure(ResponseCode.connectTimeout, "");
      case DataSourceError.cancel:
        return Failure(ResponseCode.cancel, "");
      case DataSourceError.receiveTimeout:
        return Failure(ResponseCode.receiveTimeout, "");
      case DataSourceError.sendTimeout:
        return Failure(ResponseCode.sendTimeout, "");
      case DataSourceError.cacheError:
        return Failure(ResponseCode.cacheError, "");
      case DataSourceError.noInterntConnection:
        return Failure(ResponseCode.noInterntConnection, "");
      case DataSourceError.other:
        return Failure(ResponseCode.other, "");

      case DataSourceError.serverError:
        return Failure(ResponseCode.serverError, "");
      case DataSourceError.cachedError:
        return Failure(ResponseCode.cachedError, "");
      case DataSourceError.invalidInput:
        return Failure(ResponseCode.invalidInput, "error input");
    }
  }
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unAuthorised = 401; // failure, user is not authorised
  static const int forbidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found
  static const int serverError = 607; // failure, not found
  static const int cachedError = 608; // failure, not found
  static const int invalidInput = 609; // failure, not found

  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInterntConnection = -6;
  static const int other = -7;
}

// class ResponseMessage {
//   static const String success = AppStrings.success; // success with data
//   static const String noContent =
//       AppStrings.success; // success with no data (no content)
//   static const String badRequest =
//       AppStrings.badRequestError; // failure, API rejected request
//   static const String unAuthorised =
//       AppStrings.unauthorizedError; // failure, user is not authorised
//   static const String forbidden =
//       AppStrings.forbiddenError; //  failure, API rejected request
//   static const String internalServerError =
//       AppStrings.internalServerError; // failure, crash in server side
//   static const String notFound =
//       AppStrings.notFoundError; // failure, crash in server side

//   // local status code
//   static const String CONNECT_TIMEOUT = AppStrings.timeoutError;
//   static const String cancel = AppStrings.otherError;
//   static const String receiveTimeout = AppStrings.timeoutError;
//   static const String sendTimeout = AppStrings.timeoutError;
//   static const String cacheError = AppStrings.cacheError;
//   static const String noInterntConnection = AppStrings.noInternetError;
//   static const String other = AppStrings.otherError;
// }

class ApiInternalStatus {
  static const int success = 0;
  static const int failue = 1;
}

class Failure extends Equatable {
  int code; // 200, 201, 400, 303..500 and so on
  String message; // error , success

  Failure(this.code, this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [code, message];
}
