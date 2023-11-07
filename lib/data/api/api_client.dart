import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  ApiClient({required this.appBaseUrl});

  final String appBaseUrl;

  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return const Response(statusCode: 1);
    }
  }
}
