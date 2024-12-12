import 'package:freezed_annotation/freezed_annotation.dart';

part 'study_card_model.freezed.dart';
part 'study_card_model.g.dart';

@freezed
class StudyCardModel with _$StudyCardModel {
  const factory StudyCardModel({
    required final String question,
    required final String answer,
  }) = _StudyCardModel;

  factory StudyCardModel.fromJson(final Map<String, dynamic> json) =>
      _$StudyCardModelFromJson(json);
}
