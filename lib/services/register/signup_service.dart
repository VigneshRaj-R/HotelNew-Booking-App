import 'package:dio/dio.dart';
import 'package:hotelnew/model/register/sign_in/sign_resp.dart';
import 'package:hotelnew/model/register/sign_up/signup_mod.dart';
import 'package:hotelnew/services/dio/api_exp.dart';
import 'package:hotelnew/services/dio/dio_service.dart';
import 'package:hotelnew/services/dio/intenet_checker.dart';
import 'package:hotelnew/utils/url.dart';

class SignUpService {
  Future<SignInResponseModel> signUpRepo(SignUpModel data) async {
    if (await internetCheck()) {
      try {
        final Response response =
            await DioService.postMethod(url: Url.signup, value: data.toJson());
        if (response.statusCode == 200 && response.statusCode! <= 299) {
          return SignInResponseModel.fromJson(response.data);
        } else {
          return SignInResponseModel.fromJson(response.data);
        }
      } catch (e) {
        return SignInResponseModel(message: ApiExceptions.handleError(e));
      }
    } else {
      return SignInResponseModel(message: "Poor internet connection!!");
    }
  }
}
