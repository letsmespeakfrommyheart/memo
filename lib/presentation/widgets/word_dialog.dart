import 'package:flutter/material.dart';
import 'package:memo/srs/colors.dart';

class WordDialog extends StatelessWidget {
  const WordDialog({
    required this.wordController,
    required this.transcriptionController,
    required this.translationController,
    required this.toAddNewWord,
    super.key,
  });
  final TextEditingController wordController;
  final TextEditingController transcriptionController;
  final TextEditingController translationController;
  final Function()? toAddNewWord;

  @override
  Widget build(final BuildContext context) => Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                cursorColor: tealColor,
                style: const TextStyle(fontSize: 28),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: tealColor),
                  ),
                  hintText: 'Word',
                  hintStyle: const TextStyle(fontSize: 24),
                  focusColor: Colors.grey,
                ),
                controller: wordController,
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                cursorColor: tealColor,
                style: const TextStyle(fontSize: 28),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: tealColor),
                  ),
                  hintText: 'Transcription',
                  hintStyle: const TextStyle(fontSize: 24),
                ),
                controller: transcriptionController,
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                cursorColor: tealColor,
                style: const TextStyle(fontSize: 28),
                decoration: InputDecoration(
                  hintText: 'Translation',
                  hintStyle: const TextStyle(fontSize: 24),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: tealColor),
                  ),
                ),
                controller: translationController,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: toAddNewWord,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(tealColor),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  'Add a new word',
                  style: TextStyle(
                    fontSize: 22,
                    color: milkColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
