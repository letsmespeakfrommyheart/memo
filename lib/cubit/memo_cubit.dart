import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:memo/data/filter_model.dart';
import 'package:memo/data/memorisation_model.dart';
import 'package:memo/presentation/widgets/translate_dialog.dart';

part 'memo_cubit_states.dart';
part 'memo_cubit.freezed.dart';

class MemoCubit extends Cubit<MemoCubitStates> {
  MemoCubit() : super(const MemoCubitStates()) {
    unawaited(_initHive());
  }

  final String memoryBoxName = 'MemorizationBox';

  Future<void> _initHive() async {
    final memoryBox = await Hive.openBox<MemorisationModel>(memoryBoxName);
    // final memoryBox = Hive.box<MemorisationModel>(memoryBoxName);
    emit(state.copyWith(listOfWords: memoryBox.values.toList()));
  }

  void onPopUp(final String value) {
    if (value case 'All') {
      emit(state.copyWith(filter: Filter.all));
    } else if (value case 'Learned') {
      emit(state.copyWith(filter: Filter.remembered));
    } else if (value case 'Not learned') {
      emit(state.copyWith(filter: Filter.unremembered));
    }
  }

  Future<void> addNewWord(
    final String word,
    final String transcription,
    final String transtation,
    final BuildContext context,
    final Box<MemorisationModel> memoryBox,
  ) async {
    final newWord = MemorisationModel(
      word: word,
      transcription: transcription,
      translation: transtation,
      isLearned: false,
    );
    await memoryBox.add(newWord);
    emit(state.copyWith(listOfWords: memoryBox.values.toList()));
    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  Future<void> onDeleteWord(
    final Box<MemorisationModel> memoryBox,
    final int index,
  ) async {
    await memoryBox.deleteAt(index);
    emit(state.copyWith(listOfWords: memoryBox.values.toList()));
  }

  Future<void> onShowTranslate(
    final BuildContext context,
    final MemorisationModel memoWord,
  ) async {
    await showDialog(
      context: context,
      builder: (final context) => TranslateDialog(
        translationText: memoWord.translation,
      ),
    );
  }

  Future<void> onChangeLearningState(
    final MemorisationModel memoWord,
    final Box<MemorisationModel> memoryBox,
    final int key,
  ) async {
    if (memoWord.isLearned case false) {
      final learnedWord = MemorisationModel(
        word: memoWord.word,
        transcription: memoWord.transcription,
        translation: memoWord.translation,
        isLearned: true,
      );
      await memoryBox.put(key, learnedWord);
      emit(state.copyWith(listOfWords: memoryBox.values.toList()));
    } else if (memoWord.isLearned case true) {
      final notLearnedWord = MemorisationModel(
        word: memoWord.word,
        transcription: memoWord.transcription,
        translation: memoWord.translation,
        isLearned: false,
      );
      await memoryBox.put(key, notLearnedWord);
      emit(state.copyWith(listOfWords: memoryBox.values.toList()));
    }
  }

  void filterKeys(final Filter filter, final Box<MemorisationModel> words) {
    List<int> filteredKeys;
    switch (filter) {
      case Filter.all:
        filteredKeys = words.keys.cast<int>().toList();
      case Filter.remembered:
        filteredKeys = words.keys
            .cast<int>()
            .where((final key) => words.get(key)?.isLearned ?? false)
            .toList();
      case Filter.unremembered:
        filteredKeys = words.keys
            .cast<int>()
            .where((final key) => !words.get(key)!.isLearned)
            .toList();

        emit(state.copyWith(filteredKeys: filteredKeys));
    }
  }
}
