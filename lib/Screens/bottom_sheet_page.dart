import 'package:flutter/material.dart';
import 'package:memo_app/consonants.dart';

class BottomSheetPage extends StatelessWidget {
  final VoidCallback onPressed;
  final TextEditingController title;
  final TextEditingController body;

  const BottomSheetPage({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff5D5B5C),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: "  Enter the title",
                  ),
                  controller: title,
                ),
                TextField(
                  controller: body,
                  decoration: const InputDecoration(
                    hintText: "Enter the Note",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 10,
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: kAddMemoClickStyle,
                  height: 40,
                  width: 100,
                  child: TextButton(
                    onPressed: onPressed,
                    child: const Text(
                      'Add Memo',
                      style: kAddMemoTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
