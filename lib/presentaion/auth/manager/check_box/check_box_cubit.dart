import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'check_box_state.dart';

@injectable
class CheckBoxCubit extends Cubit<CheckBoxState> {
  CheckBoxCubit() : super( const Init());
  bool ?isFirstChecked = false  ;
  bool ?isSecondChecked = false  ;
  emitFirstChangeCheckBox( Firstvalue) {
     emit(CheckBoxState.init());
    isFirstChecked = Firstvalue;
    emit(const CheckBoxState.changeFirstCheckBox());


  } emitSecondChangeCheckBox(  Secondvalue) {
             emit(CheckBoxState.init());
    isSecondChecked = Secondvalue;
    emit(const CheckBoxState.changeSecondCheckBox());

  }

}

