import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String? url;

  const AvatarWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final imageUrl = url?.isNotEmpty == true
        ? url!
        : 'https://i.pinimg.com/736x/36/cf/59/36cf596a3c731d37723a0fc8d50e9df0.jpg';

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blueGrey[600],
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 70,
        backgroundColor: Colors.black,
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}
