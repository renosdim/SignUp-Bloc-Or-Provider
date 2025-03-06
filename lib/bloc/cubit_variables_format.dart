import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_project_flutter/bloc/auth_state.dart';

class CubitVariablesFormat extends Cubit<AuthState> {
  String? email;
  String? password;

  CubitVariablesFormat(super.initialState);
}
