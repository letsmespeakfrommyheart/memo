import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memo/cubit/memo_cubit.dart';
import 'package:memo/presentation/widgets/memo_action_button.dart';
import 'package:memo/presentation/widgets/memo_word_item.dart';
import 'package:memo/presentation/widgets/word_dialog.dart';

class MemoWordScreen extends StatefulWidget {
  const MemoWordScreen({
    super.key,
  });

  @override
  State<MemoWordScreen> createState() => _MemoWordScreenState();
}

class _MemoWordScreenState extends State<MemoWordScreen> {
  final TextEditingController wordController = TextEditingController();
  final TextEditingController transcriptionController = TextEditingController();
  final TextEditingController translationController = TextEditingController();
  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<MemoCubit, MemoCubitStates>(
        builder: (final context, final state) {
          final memoCubit = context.read<MemoCubit>();
          final filteredKeys = memoCubit.state.filteredKeys;
          return Stack(
            children: [
              ListView.separated(
                itemCount: filteredKeys.length,
                itemBuilder: (final context, final index) {
                  final key = filteredKeys[index];
                  final memoWord = memoCubit.memoryBox.get(key);
                  if (memoWord != null) {
                    return MemoWordItem(
                      memorisationWord: memoWord.word,
                      memorisationTranscription: memoWord.transcription,
                      memorisationTranslation: memoWord.translation,
                      onChangeLearningState: () async {
                        await context
                            .read<MemoCubit>()
                            .onChangeLearningState(memoWord, key);
                      },
                      onDeleteWord: () async {
                        await context.read<MemoCubit>().onDeleteWord(index);
                      },
                      onShowTranslate: () async {
                        await context
                            .read<MemoCubit>()
                            .onShowTranslate(context, memoWord);
                      },
                      iconColor: memoWord.isLearned
                          ? Colors.amber
                          : Colors.grey.shade600,
                    );
                  }
                  return null;
                },
                separatorBuilder: (final context, final index) =>
                    const Divider(),
                shrinkWrap: true,
              ),
              Positioned(
                child: MemoActionButton(
                  onActionButtonPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (final context) => WordDialog(
                        wordController: wordController,
                        transcriptionController: transcriptionController,
                        translationController: translationController,
                        toAddNewWord: () async {
                          final String wordText = wordController.text;
                          final String transcriptionText =
                              transcriptionController.text;
                          final String translationText =
                              translationController.text;

                          await context.read<MemoCubit>().addNewWord(
                                wordText,
                                transcriptionText,
                                translationText,
                                context,
                              );
                          wordController.clear();
                          transcriptionController.clear();
                          translationController.clear();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      );
}
