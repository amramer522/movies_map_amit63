import 'package:dio/dio.dart';

import 'cache_helper.dart';

class DioHelper {
   final _dio = Dio(BaseOptions(
    baseUrl: "https://thimar.amr.aait-d.com/api/",
    headers: {
      "Accept":"application/json",
      "Authorization":"Bearer ${CacheHelper.token}"
    }
  ));

   Future<CustomResponse> get(String path) async {
    try {
      final response = await _dio.get(path);
      print(response.data);
      return CustomResponse(isSuccess: true, data: response.data);
    } on DioException catch (ex) {
      return handleException(ex);
    }
  }

   Future<CustomResponse> send(String path,{Map<String,dynamic>? data}) async {
    try {
      final response = await _dio.post(path, data: data);
      print(response.data);
      return CustomResponse(isSuccess: true, data: response.data);
    } on DioException catch (ex) {
      return handleException(ex);
    }
  }



   CustomResponse handleException(DioException ex) {
    // print(ex);
    print(ex.response?.data);
    String? msg = ex.response?.data["message"];

    return CustomResponse(isSuccess: false, message: msg ?? ex.type.name);
  }
}

class CustomResponse {
  final bool isSuccess;
  final dynamic data;
  String? message;

  CustomResponse({required this.isSuccess, this.message, this.data}){
    message = message??"Failed Try Again Later";
  }
}
