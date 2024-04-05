import 'package:dio/dio.dart';





class ApiService {

  final Dio _dio;
  final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/';
  ApiService(this._dio);


  Future get({
    required String urlEndPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await _dio.get(
      '$_baseUrl$urlEndPoint',
      options: Options(
        receiveDataWhenStatusError: true,
      ),
      queryParameters: queryParameters,
    );
    return response.data;
  }

// Future<Map<String, dynamic>> post({
//   required String urlEndPoint,
//   String? token,
//   Map<String, dynamic>? queryParameters,
//   @required Map<String, dynamic>? data,
//
// }) async {
//   var response =await  _dio.post(
//     '$_baseUrl$urlEndPoint',
//       options: Options(
//       headers: {
//       "lang": lang,
//       "Content-Type": "application/json",
//       'Authorization': token ?? '',
//       },
//
//   ),
//     queryParameters: queryParameters,
//       data: data,
//   );
//   return response.data;
// }
//
// Future<Map<String, dynamic>> put({
//   required String urlEndPoint,
//   String? token,
//   Map<String, dynamic>? data,
//   Map<String, dynamic>? queryParameters,
// }) async {
//   var response = await _dio.put(
//     '$_baseUrl$urlEndPoint',
//     options: Options(
//       receiveDataWhenStatusError: true,
//       headers: {
//         "lang": lang,
//         "Content-Type": "application/json",
//         'Authorization': token ?? '',
//       },
//     ),
//     queryParameters: queryParameters,
//     data: data,
//   );
//   return response.data;
// }
//
// Future<Map<String, dynamic>> delete({
//   required String urlEndPoint,
//   String? token,
//   Map<String, dynamic>? queryParameters,
// }) async {
//   var response = await _dio.delete(
//     '$_baseUrl$urlEndPoint',
//     options: Options(
//       receiveDataWhenStatusError: true,
//       headers: {
//         "lang": lang,
//         "Content-Type": "application/json",
//         'Authorization': token ?? '',
//       },
//     ),
//     queryParameters: queryParameters,
//   );
//   return response.data;
// }



}
