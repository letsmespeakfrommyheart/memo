import 'package:flutter/material.dart';

class MemoActionButton extends StatelessWidget {
  const MemoActionButton({
    required this.onActionButtonPressed,
    super.key,
  });

  final Function()? onActionButtonPressed;

  @override
  Widget build(final BuildContext context) => FloatingActionButton(
        onPressed: onActionButtonPressed,
        // onPressed: () async {
        //   await showDialog(
        //     context: context,
        //     builder: (final context) => WordDialog(
        //       wordController: wordController,
        //       transcriptionController: transcriptionController,
        //       translationController: translationController,
        //       memoryBox: memoryBox,
        //     ),
        //   );
        // },
        child: const Icon(
          Icons.add,
        ),
      );
}
