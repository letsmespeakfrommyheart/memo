part of 'memo_cubit.dart';

@freezed
class MemoCubitStates with _$MemoCubitStates {
  const factory MemoCubitStates({
    @Default('') final String popUpValue,
    @Default([]) final List<dynamic> items,
  }) = _MemoCubitStates;
}
