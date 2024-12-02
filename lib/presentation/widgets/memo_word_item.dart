import 'package:flutter/material.dart';
import 'package:memo/srs/colors.dart';

class MemoWordItem extends StatelessWidget {
  const MemoWordItem({
    required this.memorisationWord,
    required this.memorisationTranscription,
    required this.memorisationTranslation,
    required this.onChangeLearningState,
    required this.onDeleteWord,
    required this.onShowTranslate,
    required this.iconColor,
    super.key,
  });

  final String memorisationWord;
  final String memorisationTranscription;
  final String memorisationTranslation;
  final Function()? onChangeLearningState;
  final Function()? onDeleteWord;
  final Function()? onShowTranslate;
  final Color iconColor;

  @override
  Widget build(final BuildContext context) => ListTile(
        tileColor: milkColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: greenColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        contentPadding: const EdgeInsets.only(left: 10, right: 5),
        minLeadingWidth: 0,
        minVerticalPadding: 0,
        title: Transform.translate(
          offset: const Offset(0, 1),
          child: Text(
            memorisationWord,
            style: const TextStyle(fontSize: 35),
          ),
        ),
        subtitle: Transform.translate(
          offset: const Offset(0, -5),
          child: Text(
            '[ $memorisationTranscription ]',
            style: const TextStyle(fontSize: 26),
          ),
        ),
        leading: IconButton(
          onPressed: onChangeLearningState,
          icon: Icon(
            Icons.grade,
            color: iconColor,
            size: 32,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.clear),
          color: redColor,
          onPressed: onDeleteWord,
        ),
        onTap: onShowTranslate,
      );
}
