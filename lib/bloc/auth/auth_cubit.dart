import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthStatus { authenticated, unauthenticated }

class AuthCubit extends Cubit<bool> {
  AuthCubit() : super(false);
  void changeAuth(bool value) => emit(value);
}
