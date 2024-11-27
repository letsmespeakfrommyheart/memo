part of 'memo_cubit.dart';

@freezed
class MemoCubitStates with _$MemoCubitStates {
  const factory MemoCubitStates({
    @Default('') final String popUpValue,
    @Default([]) final List<dynamic> listOfWords,
    @Default(Filter.all) final Filter filter,
    @Default('') final String word,
    @Default('') final String transcription,
    @Default('') final String translation,
    @Default(false) final bool isLearned,
    @Default([]) final List<int> filteredKeys,
  }) = _MemoCubitStates;
}
