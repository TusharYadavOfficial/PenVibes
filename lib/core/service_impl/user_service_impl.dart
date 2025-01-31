import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pen_vibes/models/user_model.dart';

import '../services/user_service.dart';

class UserServiceImpl extends UserService {
  final Dio dio;

  UserServiceImpl({required this.dio});
  @override
  Future<bool> createUser({required UserModel userModel}) async {
    try {
      Response respone = await dio.post('/user', data: userModel.toJson());
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
}
