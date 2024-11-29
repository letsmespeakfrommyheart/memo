import 'package:flutter/material.dart';

class MemoActionButton extends StatelessWidget {
  const MemoActionButton({
    required this.onActionButtonPressed,
    super.key,
  });

  final Function()? onActionButtonPressed;

  @override
  Widget build(final BuildContext context) => ElevatedButton.icon(
        onPressed: onActionButtonPressed,
        label: const Icon(
          Icons.add,
        ),
      );
}
