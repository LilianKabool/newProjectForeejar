import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

part'change_info_state.dart';
part'change_info_cubit.freezed.dart';

@injectable
class ChangeInfoCubit extends Cubit<ChangeInfoState> {
  ChangeInfoCubit() : super( const ChangeInfoState.init());
 String newName  =' ';
 String newNameForattribute  =' ';
 String newCaption  =' ';
 String newPrice  =' ';
  emitCaptionForUpdateProduct( caption) {
    emit(ChangeInfoState.init());
    newCaption  = caption;
    emit(const ChangeInfoState.changeCaption());
    print("this is new caption ${newCaption}") ;
    return newCaption ;

  }
  DateTime selectedDate = DateTime.now();
  var editing_date = 'Enter Date';

  bool showDate = false;
  emitNameForUpdateProduct( name) {
     emit(ChangeInfoState.init());
    newName  = name;
    emit(const ChangeInfoState.changeName());
    print("this is new name ${newName}") ;
     return newName ;

  }

emitDateForUpdateProduct( newSelectedDate , newShowDate) {
     emit(ChangeInfoState.init());
     selectedDate = newSelectedDate;
       editing_date = DateFormat('yyyy-MM-dd').format(selectedDate);
       showDate = newShowDate;
       print('Selected date: ${DateFormat.yMMMd().format(selectedDate)}');

    print("this is new date ${newSelectedDate}") ;
    print("this is selectDate date ${selectedDate}") ;
     emit(const ChangeInfoState.changeDate());
     return selectedDate ;

  }


  emitPriceForUpdateProduct( price) {
    emit(ChangeInfoState.init());
    newPrice  = price;
    emit(const ChangeInfoState.changePrice());
    print("this is new price ${newPrice}") ;
    return newPrice ;

  }
  emitNameForUpdateAttribute( name) {
    emit(ChangeInfoState.init());
    newNameForattribute  = name;
    emit(const ChangeInfoState.changeName());
    print("this is new name ${newNameForattribute}") ;
    return newNameForattribute ;

  }
}

