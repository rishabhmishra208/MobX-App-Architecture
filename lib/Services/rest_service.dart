import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../Config/config.dart';
import '../Controllers/controllers_export.dart';
import '../Interceptors/interceptors_export.dart';

class RestService {
  final Dio _dio;
  Uuid uuid = const Uuid();

  RestService(final AuthController authController)
      : _dio = Dio(
          BaseOptions(
            baseUrl: '$API_BASE_URL/v1',
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
          ),
        )..interceptors.add(
            AuthInterceptor(authController),
          );

  // Future<LoginModel> loginWithOTP({
  //   required String userAuth,
  //   required String otp,
  //   required String uuid,
  // }) async {
  //   final data = {
  //     "phone": userAuth,
  //     'otp': otp,
  //     'device': DEVICE_TYPE,
  //     'idempotent_key': uuid,
  //   };

  //   Response loginData = await _dio3.post(
  //     '/accounts/login_with_otp',
  //     data: data,
  //   );

  //   return LoginModel.fromJson(loginData.data);
  // }

  // Future<List<SubscriptionModel>> getSubscriptionHistory({
  //   required int page,
  //   required int limit,
  // }) async {
  //   Response res = await _dio.get(
  //     '/accounts/subscription/all?page=$page&limit=$limit',
  //   );

  //   var data = (res.data as List<dynamic>)
  //       .map((e) => SubscriptionModel.fromJson(e))
  //       .toList();

  //   return data;
  // }
}
