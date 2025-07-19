import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddToGroupButton extends StatefulWidget {
  final String userId;

  const AddToGroupButton({super.key, required this.userId});

  @override
  State<AddToGroupButton> createState() => _AddToGroupButtonState();
}


class _AddToGroupButtonState extends State<AddToGroupButton> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.group_add, color: Colors.blue),
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Add to Group'),
            content: TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter Group ID'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  final groupId = _controller.text.trim();
                  if (groupId.isNotEmpty) {
                    final userRef = FirebaseFirestore.instance.collection('users').doc(widget.userId);
                    final groupRef = FirebaseFirestore.instance.collection('groups').doc(groupId);

                    // Add user to group members subcollection
                    await groupRef.collection('members').doc(widget.userId).set({
                      'joinedAt': Timestamp.now(),
                      'role': 'student',
                    });

                    // Add group to user groups subcollection
                    await userRef.collection('groups').doc(groupId).set({
                      'name': (await groupRef.get()).data()?['name'] ?? 'Unnamed Group',
                      'joinedAt': Timestamp.now(),
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added to group $groupId')),
                    );
                    _controller.clear();
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
        );
      },
    );
  }
}
