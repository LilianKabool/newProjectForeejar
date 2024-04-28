import 'package:bloc/bloc.dart';

import 'drop_down_button_state.dart';

class DropDownButtonCubit extends Cubit<DropDownButtonState> {
  DropDownButtonCubit() : super(const Init());
  var selectedGender = "";
  emitDropDownButtonBox(value) {
    emit(const DropDownButtonState.init());
    selectedGender = value;
    emit(const DropDownButtonState.changeDropDownButton());
  }
}
