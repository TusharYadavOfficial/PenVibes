import 'package:equatable/equatable.dart';

import '../../models/user_model.dart';

abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitialState extends UserState {}

class NoINternetConnectionState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final UserModel user;
  UserLoadedState(this.user);

  @override
  List<Object> get props => [user];
}

class UserListLoadedState extends UserState {
  final List<UserModel> users;
  UserListLoadedState(this.users);

  @override
  List<Object> get props => [users];
}

class UserErrorState extends UserState {
  final String message;
  UserErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class UserDeletedState extends UserState {
  final String message;
  UserDeletedState(this.message);

  @override
  List<Object> get props => [message];
}

class UserUpdatedState extends UserState {
  final String message;
  UserUpdatedState(this.message);

  @override
  List<Object> get props => [message];
}

class UserCreatedState extends UserState {
  final String message;
  UserCreatedState({required this.message});

  @override
  List<Object> get props => [message];
}
