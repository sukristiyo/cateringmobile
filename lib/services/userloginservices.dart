part of '../ui/pages/pages.dart';

class UserLoginServices {
  static String endpoint = Constanta.baseApiUrl + "/UserLogin/read.php";
  static String endpoint2 = Constanta.baseApiUrl + "/UserLogin/auth.php";

  static Future<ApiResponse> getUserLogin(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  static Future<ApiResponse> authentication(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint2, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
