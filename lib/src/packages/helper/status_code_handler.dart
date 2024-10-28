import 'package:car_dekho_app/src/packages/helper/toast_messge.dart';
import 'package:car_dekho_app/src/packages/resources/my_library.dart';

abstract interface class ApiStatusCode {
  static void successFulStatus(Response<dynamic> response) {
    Log.success("API Error :- $response");
    switch (response.statusCode) {
      case 200:
        ToastMessage.showSuccessToast("Successful", "Loaded");
        break;
      case 201:
        ToastMessage.showSuccessToast("Successful", "Created");
        break;
      case 202:
        ToastMessage.showSuccessToast("Successful", "Accepted");
        break;
      case 203:
        ToastMessage.showSuccessToast(
            "Successful", "Non-Authoritative Information");
        break;
      case 204:
        ToastMessage.showSuccessToast("Successful", "No Content");
        break;
      case 205:
        ToastMessage.showSuccessToast("Successful", "Reset Content");
        break;
      case 206:
        ToastMessage.showSuccessToast("Successful", "Partial Content");
      case 207:
        ToastMessage.showSuccessToast("Successful", "Multi-Status");
        break;
      case 208:
        ToastMessage.showSuccessToast("Successful", "Already Reported");
        break;
      case 226:
        ToastMessage.showSuccessToast("Successful", "IM Used");
        break;
      default:
        ToastMessage.showErrorToast("Error", "Unknown Success Status Code");
        break;
    }
  }

  static void errorHandler(DioException error) {
    Log.error("API Error :- $error");
    switch (error.response?.statusCode) {
      case 400:
        ToastMessage.showErrorToast("Error", "Bad Request");
        break;
      case 401:
        ToastMessage.showErrorToast("Error", "Unauthorized");
        break;
      case 402:
        ToastMessage.showErrorToast("Error", "Payment Required");
        break;
      case 403:
        ToastMessage.showErrorToast("Error", "Forbidden");
        break;
      case 404:
        ToastMessage.showErrorToast("Error", "Not Found");
        break;
      case 405:
        ToastMessage.showErrorToast("Error", "Method Not Allowed");
        break;
      case 406:
        ToastMessage.showErrorToast("Error", "Not Acceptable");
        break;
      case 407:
        ToastMessage.showErrorToast("Error", "Proxy Authentication Required");
        break;
      case 408:
        ToastMessage.showErrorToast("Error", "Request Timeout");
        break;
      case 409:
        ToastMessage.showErrorToast("Error", "Conflict");
        break;
      case 410:
        ToastMessage.showErrorToast("Error", "Gone");
        break;
      case 411:
        ToastMessage.showErrorToast("Error", "Length Required");
        break;
      case 412:
        ToastMessage.showErrorToast("Error", "Precondition Failed");
        break;
      case 413:
        ToastMessage.showErrorToast("Error", "Content Too Large");
        break;
      case 414:
        ToastMessage.showErrorToast("Error", "URI Too Long");
        break;
      case 415:
        ToastMessage.showErrorToast("Error", "Unsupported Media Type");
        break;
      case 416:
        ToastMessage.showErrorToast("Error", "Range Not Satisfiable");
        break;
      case 417:
        ToastMessage.showErrorToast("Error", "Expectation Failed");
        break;
      case 418:
        ToastMessage.showErrorToast("Error", "I'm a teapot");
        break;
      case 421:
        ToastMessage.showErrorToast("Error", "Misdirected Request");
        break;
      case 422:
        ToastMessage.showErrorToast("Error", "Unprocessable Content");
        break;
      case 423:
        ToastMessage.showErrorToast("Error", "Locked");
        break;
      case 424:
        ToastMessage.showErrorToast("Error", "Failed Dependency");
        break;
      case 425:
        ToastMessage.showErrorToast("Error", "Too Early Experimental");
        break;
      case 426:
        ToastMessage.showErrorToast("Error", "Upgrade Required");
        break;
      case 428:
        ToastMessage.showErrorToast("Error", "Precondition Required");
        break;
      case 429:
        ToastMessage.showErrorToast("Error", "Too Many Requests");
        break;
      case 431:
        ToastMessage.showErrorToast("Error", "Request Header Fields Too Large");
        break;
      case 451:
        ToastMessage.showErrorToast("Error", "Unavailable For Legal Reasons");
        break;
      case 500:
        ToastMessage.showErrorToast("Error", "Internal Server Error");
        break;
      case 501:
        ToastMessage.showErrorToast("Error", "Not Implemented");
        break;
      case 502:
        ToastMessage.showErrorToast("Error", "Bad Gateway");
        break;
      case 503:
        ToastMessage.showErrorToast("Error", "Service Unavailable");
        break;
      case 504:
        ToastMessage.showErrorToast("Error", "Gateway Timeout");
        break;
      case 505:
        ToastMessage.showErrorToast("Error", "HTTP Version Not Supported");
        break;
      case 506:
        ToastMessage.showErrorToast("Error", "Variant Also Negotiates");
        break;
      case 507:
        ToastMessage.showErrorToast("Error", "Insufficient Storage");
        break;
      case 508:
        ToastMessage.showErrorToast("Error", "Loop Detected");
        break;
      case 510:
        ToastMessage.showErrorToast("Error", "Not Extended");
        break;
      case 511:
        ToastMessage.showErrorToast("Error", "Network Authentication Required");
        break;
      default:
        ToastMessage.showErrorToast("Error", "Unknown Error");
        break;
    }
  }
}
