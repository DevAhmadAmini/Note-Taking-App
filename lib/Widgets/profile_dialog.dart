import 'package:flutter/material.dart';

class ProfileDialog extends StatelessWidget {
  ProfileDialog({
    required this.name,
    required this.age,
    required this.onPressed,
  });

  final TextEditingController name;
  final TextEditingController age;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Change Your Profile"),
      actions: [
        TextField(
          controller: name,
          decoration: const InputDecoration(
            hintText: "Enter your Name",
            border: OutlineInputBorder(),
          ),
        ),
        TextField(
          controller: age,
          decoration: const InputDecoration(
            hintText: "Enter your Age",
            border: OutlineInputBorder(),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text(
            "Add Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
