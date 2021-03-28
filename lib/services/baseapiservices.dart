part of '../ui/pages/pages.dart';

class BaseApiService {
  static Future<ApiResponse> sendPostRequest(
      String url, String authToken, var requestbody) async {
    final response = await http.post(url,
        body: requestbody, headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return apiResponseFromJson(responseString);
    } else {
      return null;
    }
  }
}
