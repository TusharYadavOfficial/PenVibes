import 'package:bloc/bloc.dart';
import 'package:pen_vibes/bloc/user_bloc/user_event.dart';
import '../../common/service_locator.dart';
import '../../core/internet/custom_internet_checker.dart';
import '../../core/service_impl/user_service_impl.dart';
import 'event_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<CreateUser>(_onCreateUser);
  }

  final UserServiceImpl userService = ServiceLocator.getIt<UserServiceImpl>();

  _onCreateUser(CreateUser event, Emitter<UserState> emit) async {
    try {
      emit(UserLoadingState());
      bool connected = await CustomInternetChecker.checkInternet();
      if (connected) {
        final response =
            await userService.createUser(userModel: event.userModel);
        emit(UserCreatedState(message: "User created successfully"));
      } else {
        emit(NoINternetConnectionState());
      }
    } catch (e) {
      emit(UserErrorState(e.toString()));
    }
  }
}
