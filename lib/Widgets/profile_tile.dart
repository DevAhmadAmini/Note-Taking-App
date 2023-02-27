import 'package:flutter/material.dart';
import '../consonants.dart';

class ProfileTile extends StatelessWidget {
  final String text1;
  final String text2;
  final Color colour;
  const ProfileTile({
    super.key,
    required this.text1,
    required this.text2,
    required this.colour,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kProfileContainerDecoration.copyWith(color: colour),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Text(
            text1,
            style: kProfileTextStyle,
          ),
          const SizedBox(width: 30),
          Text(
            text2,
            style: kProfileTextStyle,
          ),
        ],
      ),
    );
  }
}
