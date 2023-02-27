import 'package:flutter/material.dart';

class PopUpMenuButton extends StatelessWidget {
  final Function(int) deleteOnPressed;
  const PopUpMenuButton({Key? key, required this.deleteOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: deleteOnPressed,
      itemBuilder: (context) {
        return const [
          PopupMenuItem(
            value: 0,
            child: Text('Delete All'),
          ),
        ];
      },
    );
  }
}
