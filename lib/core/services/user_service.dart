import '../../models/user_model.dart';

abstract class UserService {
  Future<void> createUser({required UserModel userModel});
  Future<List<UserModel>> fetchAllUsers();
}
