import 'package:flutter/material.dart';

class TextTaskes extends StatelessWidget {
  const TextTaskes({
    super.key,
    required this.name,
    required this.state,
  });

  final String name;
  final bool state;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        name,
        style: TextStyle(
          color: state
              ? const Color(0xff959fa3)
              : Colors.white,
          fontSize: state ? 18 : 20,
          fontStyle: state
              ? FontStyle.italic
              : FontStyle.normal,
          decoration: state
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}
