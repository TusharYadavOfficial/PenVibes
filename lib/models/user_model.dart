import 'package:pen_vibes/core/constants/param_constants.dart';

class UserModel {
  String name;
  String email;
  String? about;
  String phone;

  UserModel(
      {required this.name,
      required this.email,
      this.about,
      required this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json[ParamConstants.NAME],
        email: json[ParamConstants.EMAIL],
        about: json[ParamConstants.ABOUT],
        phone: json[ParamConstants.PHONE]);
  }

  Map<String, dynamic> toJson() {
    return {
      ParamConstants.NAME: name,
      ParamConstants.EMAIL: email,
      ParamConstants.ABOUT: about,
      ParamConstants.PHONE: phone,
    };
  }
}
