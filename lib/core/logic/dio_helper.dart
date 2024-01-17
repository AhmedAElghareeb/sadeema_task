import 'package:dio/dio.dart';
import 'package:quick_log/quick_log.dart';


const log = Logger("");

class DioHelper {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://t.alnefely.tk/api/",
        headers: {
          "Accept" : "application/json",
          "Authorization" : "Bearer 38|wcaxjZyJaFz9aqwRwHXlhithtMtWRVV8CCTjwac145b7e648"
        }
    )
  );

  Future<CustomResponse> sendToServer({required String url, String? token, Map<String, dynamic>? body}) async {
    try {
      if (url.isNotEmpty) {
        final response = await dio.post(
          url,
          options: Options(
            headers: {
              "Accept": "application/json",
              "Authorization" : "Bearer 38|wcaxjZyJaFz9aqwRwHXlhithtMtWRVV8CCTjwac145b7e648",
            },
          ),
          data: FormData.fromMap(
            {
              "stage_id" : 1,
              "classroom_id" : 1,
              "term_id" : 1,
              "subject_id" : 1,
            }
          ),
        );
        if (response.data["status"] != "fail") {
          return CustomResponse(
            success: true,
            statusCode: 200,
            msg: response.data["message"] ?? "Your request completed successfully",
            response: response,
          );
        } else {
          await Future.delayed(const Duration(milliseconds: 500));
          return CustomResponse(success: false, statusCode: 422, msg: response.data["message"]);
        }
      } else {
        await Future.delayed(const Duration(milliseconds: 500));
        return CustomResponse(
          success: true,
          statusCode: 200,
        );
      }
    } on DioException catch (err) {
      return handleServerError(err);
    }
  }
}

class CustomResponse {
  bool success;
  int? errType;
  String msg;
  int statusCode;
  Response? response;
  dynamic error;

  CustomResponse({
    this.success = false,
    this.errType = 0,
    this.msg = "",
    this.statusCode = 0,
    this.response,
    this.error,
  });
}

CustomResponse handleServerError(DioException err) {
  if (err.type == DioExceptionType.badResponse) {
    if (err.response!.data.toString().contains("DOCTYPE") || err.response!.data.toString().contains("<script>") || err.response!.data["exception"] != null) {
      return CustomResponse(
        errType: 2,
        statusCode: err.response!.statusCode ?? 500,
        msg: "Server Error",
      );
    }
    if (err.response!.statusCode == 401) {
      // showToast(err.response!.data["message"], duration: 3);
      // navigateTo(page: const SplashView(), leaveHistory: false);
    }
    try {
      return CustomResponse(
        statusCode: err.response?.statusCode ?? 500,
        errType: 1,
        msg: (err.response!.data["errors"] as Map).values.first.first,
        response: err.response,
      );
    } catch (e) {
      return CustomResponse(
        statusCode: err.response?.statusCode ?? 500,
        errType: 1,
        msg: err.response?.data["message"],
        response: err.response,
      );
    }
  } else if (err.type == DioExceptionType.receiveTimeout || err.type == DioExceptionType.sendTimeout) {
    log.error(err.response!.data);
    return CustomResponse(
      statusCode: err.response?.statusCode ?? 500,
      errType: 0,
      msg: "Time out error",
    );
  } else {
    if (err.response == null) {
      log.error(err.type, includeStackTrace: false);
      log.error(err.error, includeStackTrace: false);
      log.error(err.message, includeStackTrace: false);
      log.error(err.message, includeStackTrace: false);
      log.error(err.requestOptions.toString(), includeStackTrace: false);
      return CustomResponse(
        statusCode: 402,
        errType: 0,
        msg: "No Connection",
      );
    }

    return CustomResponse(
      statusCode: 402,
      errType: 2,
      success: false,
      msg: "Server Error",
    );
  }
}
