import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:memo_app/consonants.dart';
import 'package:readmore/readmore.dart';

class MemoTile extends StatefulWidget {
  final String title;
  final String body;

  final Function(BuildContext) onPressed;
  const MemoTile({
    Key? key,
    required this.title,
    required this.body,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<MemoTile> createState() => _MemoTileState();
}

class _MemoTileState extends State<MemoTile> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: widget.onPressed,
            icon: Icons.delete,
            backgroundColor: const Color.fromARGB(255, 68, 173, 71),
          ),
        ],
      ),
      child: Card(
        margin: const EdgeInsets.all(6),
        color: Colors.white,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 35,
            left: 10,
            right: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 280,
                    child: ReadMoreText(
                      widget.body,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: "Read More",
                      trimExpandedText: " Read Less",
                      lessStyle: kReadMoreOrLessStyle,
                      moreStyle: kReadMoreOrLessStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
