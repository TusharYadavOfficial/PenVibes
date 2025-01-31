import 'package:equatable/equatable.dart';
import 'package:pen_vibes/models/user_model.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateUser extends UserEvent {
  final UserModel userModel;

  CreateUser({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class UpdateUser extends UserEvent {
  final UserModel userModel;

  UpdateUser({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

class DeleteUser extends UserEvent {
  final String userId;

  DeleteUser({required this.userId});

  @override
  List<Object> get props => [userId];
}

class GetUser extends UserEvent {
  final String userId;

  GetUser({required this.userId});

  @override
  List<Object> get props => [userId];
}

class GetUsers extends UserEvent {}
