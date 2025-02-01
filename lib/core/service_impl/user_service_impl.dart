import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pen_vibes/core/constants/api_config_constants.dart';
import 'package:pen_vibes/models/user_model.dart';

import '../services/user_service.dart';

class UserServiceImpl extends UserService {
  final Dio dio;
  final Dio _dio = Dio();
  UserServiceImpl({required this.dio});
  @override
  Future<bool> createUser({required UserModel userModel}) async {
    try {
      Response respone = await dio.post(
        '${ApiConfigConstants.baseUrl}/user',
        data: userModel.toJson(),
      );
      if (respone.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<UserModel>> fetchAllUsers() async {
    try {
      log('${ApiConfigConstants.baseUrl}/user/getAllUsers');
      final response =
          await _dio.get('http://192.168.1.10:9722/user/getAllUsers');
      log(response.toString());
      return [];
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
