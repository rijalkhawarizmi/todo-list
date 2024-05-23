import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_list/src/authentication/data/models/authentication_model.dart';

import '../../../core/utils/shared_storage.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  void checkData() async {
    AuthModel? authModel = await SharedStorage.getAuth();

    if (authModel != null) {
      emit(MainDataNotEmpty());
    } else {
      emit(MainDataEmpty());
    }
  }
}
