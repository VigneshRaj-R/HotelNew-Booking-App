import 'dart:async';
import 'package:dio/dio.dart';
import 'package:hotelnew/model/register/otp/otp_model.dart';
import 'package:hotelnew/services/dio/api_exp.dart';
import 'package:hotelnew/services/dio/dio_service.dart';
import 'package:hotelnew/services/dio/intenet_checker.dart';
import 'package:hotelnew/utils/url.dart';
import '../../model/register/otp/otp_model_response.dart';
import '../../model/register/phone_number/phone_number_model.dart';
import '../../model/register/phone_number/phone_number_response_model.dart';

class PhoneNumberService {
  // ==========>>>>>  MOBILE NUMBER VERIFY SERVICE  <<<<<==========
  Future<PhoneNumberResponseModel?> phoneNumberRepo(
      PhoneNumberModel data) async {
    // if (await internetCheck()) {
    try {
      
      final Response response =
          await DioService.postMethod(url: Url.sendOtp, value: data.toJson());
      
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
       
        return PhoneNumberResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
     
      return PhoneNumberResponseModel(message: ApiExceptions.handleError(e));
    }
    //}
    // else {
    //   return PhoneNumberResponseModel(message: "No Internet !!");
    // }
  }

  // ==========>>>>>  OTP VERIFY SERVICE  <<<<<==========
  Future<OtpResponseModel> otpVerifyRepo(OtpModel data) async {
    if (await internetCheck()) {
      try {
        final response = await DioService.postMethod(
            url: Url.otpVerify, value: data.toJson());
        if (response.statusCode >= 200 || response.statusCode <= 299) {
          return OtpResponseModel.fromJson(response.data);
        } else {
          return OtpResponseModel.fromJson(response.data);
        }
      } catch (e) {
        return OtpResponseModel(message: ApiExceptions.handleError(e));
      }
    } else {
      return OtpResponseModel(message: "Poor internet connection!!");
    }
  }
}
