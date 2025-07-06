import 'package:flutter/material.dart';

class Checked extends StatelessWidget {
  final bool state;
  final ValueChanged<bool> onChanged;

  const Checked({super.key, required this.state, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: state,
      onChanged: (bool? value) {
        if (value != null) {
          onChanged(value);
        }
      },
      side: BorderSide(
        width: 4,
        color: state ? Colors.white : const Color(0xff959fa3),
      ),
      checkColor: const Color(0xff04151c),
      activeColor: const Color(0xff959fa3),
    );
  }
}
