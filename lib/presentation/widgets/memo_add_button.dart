import 'package:flutter/material.dart';
import 'package:memo/srs/colors.dart';

class MemoAddButton extends StatelessWidget {
  const MemoAddButton({
    required this.onAddButtonPressed,
    super.key,
  });

  final Function()? onAddButtonPressed;

  @override
  Widget build(final BuildContext context) => Card(
        color: redColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: IconButton(
          onPressed: onAddButtonPressed,
          icon: const Icon(Icons.add),
          color: milkColor,
          iconSize: 30,
        ),
      );
}
