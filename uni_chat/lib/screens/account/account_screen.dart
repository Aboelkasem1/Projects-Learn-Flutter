// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'widgets/avatar_widget.dart';
import 'widgets/editable_name_widget.dart';
import 'widgets/email_display.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);
  static const String ID = 'AccountScreen';

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isEdit = false;
  final TextEditingController nameController = TextEditingController();

  User? get user => FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    nameController.text = user?.displayName ?? '';
  }

  Future<void> updateDisplayName() async {
    final newName = nameController.text.trim();
    if (newName.isEmpty || newName == user?.displayName) return;

    await user!.updateDisplayName(newName);
    await user!.reload();
    FocusScope.of(context).unfocus();

    setState(() => isEdit = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Name updated to "$newName"'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        title: const Text('Account', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 1),
            AvatarWidget(url: user?.photoURL ?? ''),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: EditableNameWidget(
                isEdit: isEdit,
                controller: nameController,
                displayName: user?.displayName,
                onEditPressed: () => setState(() => isEdit = true),
                onSubmit: updateDisplayName,
              ),
            ),
            const SizedBox(height: 10),
            EmailDisplay(user: user),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
