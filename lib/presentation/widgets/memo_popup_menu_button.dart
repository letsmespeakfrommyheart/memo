import 'package:flutter/material.dart';
import 'package:memo/srs/colors.dart';

class MemoPopupMenuButton extends StatelessWidget {
  const MemoPopupMenuButton({
    required this.onSelectedItem,
    super.key,
  });

  final Function(String)? onSelectedItem;
  @override
  Widget build(final BuildContext context) => Card(
        color: greenColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: PopupMenuButton<String>(
          position: PopupMenuPosition.under,
          icon: Icon(
            Icons.menu,
            color: milkColor,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: milkColor, width: 2),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          color: greenColor,
          onSelected: onSelectedItem,
          itemBuilder: (final context) => [
            'All',
            'Learned',
            'Not learned',
          ]
              .map(
                (final option) => PopupMenuItem(
                  value: option,
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 20,
                      color: milkColor,
                      fontFamily: 'Caveat',
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      );
}
