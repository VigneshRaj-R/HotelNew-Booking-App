import 'package:dio/dio.dart';
import 'package:hotelnew/model/register/sign_in/sign_resp.dart';
import 'package:hotelnew/model/register/sign_in/signin_model.dart';
import 'package:hotelnew/services/dio/api_exp.dart';
import 'package:hotelnew/services/dio/dio_service.dart';
import 'package:hotelnew/services/dio/intenet_checker.dart';
import 'package:hotelnew/utils/url.dart';


class SignInService {
  Future<SignInResponseModel?> signInRepo(SignInModel data) async {
    if (await internetCheck()) {
      try {
        final Response response =
            await DioService.postMethod(url: Url.login, value: data.toJson());
        if (response.statusCode! >= 200 || response.statusCode! <= 299) {
          return SignInResponseModel.fromJson(response.data);
        } else {
          return null;
        }
      } catch (e) {
        return SignInResponseModel(message: ApiExceptions.handleError(e));
      }
    } else {
      return SignInResponseModel(message: "Poor internet connection!!");
    }
  }
}