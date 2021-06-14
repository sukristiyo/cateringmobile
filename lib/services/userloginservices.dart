part of '../ui/pages/pages.dart';

class UserLoginServices {
  static String endpoint1 = Constanta.baseApiUrl + "/UserLogin/auth.php";
  static String endpoint2 = Constanta.baseApiUrl + "/UserLogin/insert.php";
  static String endpoint3 = Constanta.baseApiUrl + "/UserLogin/update.php";
  static String endpoint4 = Constanta.baseApiUrl + "/UserLogin/delete.php";
  static String endpoint5 =
      Constanta.baseApiUrl + "/UserLogin/resetpassword.php";
  static String endpoint6 =
      Constanta.baseApiUrl + "/UserLogin/sendemailverification.php";
      static String endpoint7 =
      Constanta.baseApiUrl + "/UserLogin/read.php";

  static Future<ApiResponse> authentication(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint1, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  static Future<ApiResponse> insertData(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint2, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  static Future<ApiResponse> changePassword(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint5, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  static Future<ApiResponse> sendEmailVerification(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint6, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
  static Future<ApiResponse> getUserLogin(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint7, "", requestBody).then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
