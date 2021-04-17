part of '../ui/pages/pages.dart';

class UserLoginServices {
  static String endpoint = Constanta.baseApiUrl + "/UserLogin/auth.php";

  static Future<ApiResponse> authentication(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
