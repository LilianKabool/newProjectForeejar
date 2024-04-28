
import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_exceptions.dart';

part 'api_result.freezed.dart';
@freezed
abstract class ApisResult<T> with _$ApisResult {
  const factory ApisResult.success( T data)= Success<T> ;
  const factory ApisResult.faliure( NetworkExceptions error)= Faliure<T> ;

}

