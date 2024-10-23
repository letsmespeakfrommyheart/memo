import 'package:flutter/material.dart';

class TranslateDialog extends StatelessWidget {
  const TranslateDialog({
    required this.translationText,
    super.key,
  });
  final String translationText;
  @override
  Widget build(final BuildContext context) => Dialog(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            translationText,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      );
}
