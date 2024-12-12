part of 'memo_cubit.dart';

@freezed
class MemoCubitState with _$MemoCubitState {
  const factory MemoCubitState({
    @Default([]) final List<dynamic> listOfWords,
    @Default(Filter.all) final Filter filter,
    @Default([]) final List<int> filteredKeys,
    @Default([]) final List<StudyCardModel> questions,
  }) = _MemoCubitState;
}
