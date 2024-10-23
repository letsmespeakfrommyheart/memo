import 'package:flutter/material.dart';
import 'package:memo/srs/colors.dart';

class MemoPopupMenuButton extends StatelessWidget {
  const MemoPopupMenuButton({
    required this.onSelectedItem,
    super.key,
  });

  final Function(String)? onSelectedItem;
  @override
  Widget build(final BuildContext context) => PopupMenuButton<String>(
        icon: const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(
            Icons.arrow_drop_down,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        color: milk,
        onSelected: onSelectedItem,
        itemBuilder: (final context) => [
          'All',
          'Learned',
          'Not learned',
        ]
            .map(
              (final option) => PopupMenuItem(
                textStyle: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'Caveat',
                ),
                value: option,
                child: Text(option),
              ),
            )
            .toList(),
      );
}
