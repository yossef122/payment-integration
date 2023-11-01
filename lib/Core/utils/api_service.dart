import 'package:dio/dio.dart';
import 'package:payment/Core/utils/api_keys.dart';

class ApiService {
  late final Dio? dio = Dio();

  // final _baseUrl = 'https://api.stripe.com/v1';
  // ApiService({required this.dio}) {
  // BaseOptions baseOptions = BaseOptions(
  //   receiveDataWhenStatusError: true,
  // );
  // dio = Dio(baseOptions);

  Future<Response> Post({
    required body,
    required String endPoint,
    required String token,
    String? contentType,
    Map<String, String>? headers,
  }) async {
    var response = await dio!.post(
      ApiKeys.baseUrl + endPoint,
      data: body,
      options: Options(
        headers: headers ?? {"Authorization": "Bearer $token"},
        contentType: contentType ?? Headers.formUrlEncodedContentType,
      ),
    );
    return response;
  }
}
