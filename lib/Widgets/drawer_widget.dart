import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memo_app/Widgets/profile_dialog.dart';
import 'package:memo_app/Widgets/profile_tile.dart';
import '../consonants.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  var name = "...........";
  var age = "....";
  var nameContoller = TextEditingController();
  var ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  File? image;
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final temporaryImage = File(image.path);
    this.image = temporaryImage;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // getting image from gallery
                pickImage();
              },
              child: ClipOval(
                child: image != null
                    ? Image.file(
                        image!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'images/noNote.jpg',
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
              ),
            ),
            const SizedBox(height: 15),
            ProfileTile(
              text1: "Name :",
              text2: name,
              colour: Colors.red,
            ),
            const SizedBox(height: 6),
            ProfileTile(
              text1: "age :",
              text2: age,
              colour: Colors.green,
            ),
            const SizedBox(height: 20),
            Container(
              decoration: kProfileContainerDecoration,
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return ProfileDialog(
                        name: nameContoller,
                        age: ageController,
                        onPressed: () {
                          name = nameContoller.text;
                          age = ageController.text;
                          setState(() {});
                          Navigator.pop(context);
                          nameContoller.clear();
                          ageController.clear();
                        },
                      );
                    },
                  );
                },
                child: const Text(
                  "Change Profile",
                  style: kProfileTextStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
