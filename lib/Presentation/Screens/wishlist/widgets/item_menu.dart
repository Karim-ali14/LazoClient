import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final Function? action;
  const ItemMenu({super.key, this.text, this.style, this.action});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        action?.call();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        width: 180,
        child: Row(
          children: [
            Expanded(
              child: Center(child: Text(text ?? "", style: style)),
            ),
          ],
        ),
      ),
    );
  }
}
