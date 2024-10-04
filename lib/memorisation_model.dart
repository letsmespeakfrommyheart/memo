import 'package:hive/hive.dart';

part 'memorisation_model.g.dart';

@HiveType(typeId: 0)
class MemorisationModel extends HiveObject {
  @HiveField(0)
  final String word;
  @HiveField(1)
  final String transcription;
  @HiveField(2)
  final bool isLearned;
  @HiveField(3)
  final String translation;

  MemorisationModel(
      {required this.word,
      required this.transcription,
      required this.isLearned,
      required this.translation});
}
