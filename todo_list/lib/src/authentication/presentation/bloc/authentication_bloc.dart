import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_list/src/authentication/data/models/authentication_model.dart';
import '../../../../core/utils/shared_storage.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/signin_user.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required SignIn signIn})
      : _signIn = signIn,
        super(AuthenticationInitial()) {
    on<EventAuthentication>(_signInHandler);
    on<EventObscurePassword>(obscurePassword);
    on<EventObscurePasswordConfirm1>(obscurePasswordConfirm1);
    on<EventObscurePasswordConfirm2>(obscurePasswordConfirm2);
  }

  final SignIn _signIn;

  Future<void> _signInHandler(
      EventAuthentication event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    final result = await _signIn(
        SignInParams(email: event.email, password: event.password));

    result.fold((failure) async {
      return emit(AuthenticationError(failure.errorMessage));
    }, (data) async {
      if (data == null) {
        emit(const AuthenticationError('Nama atau Password salah'));
      } else {
        return emit(AuthenticationSuccess(authEntity: data));
      }
    });
  }

  void obscurePassword(
      EventObscurePassword event, Emitter<AuthenticationState> emit) {
    emit(ObscurePassword(obscurePass: event.obscurePassword));
  }

  void obscurePasswordConfirm1(
      EventObscurePasswordConfirm1 event, Emitter<AuthenticationState> emit) {
    emit(ObscurePasswordConfirm1(
        obscurePassConfirm1: event.obscurePasswordConfirm1));
  }

  void obscurePasswordConfirm2(
      EventObscurePasswordConfirm2 event, Emitter<AuthenticationState> emit) {
    emit(ObscurePasswordConfirm2(
        obscurePassConfirm2: event.obscurePasswordConfirm2));
  }
}
