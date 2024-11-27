part of 'memo_cubit.dart';

@freezed
class MemoCubitStates with _$MemoCubitStates {
  const factory MemoCubitStates({
    @Default([]) final List<dynamic> listOfWords,
    @Default(Filter.all) final Filter filter,
    @Default([]) final List<int> filteredKeys,
  }) = _MemoCubitStates;
}
