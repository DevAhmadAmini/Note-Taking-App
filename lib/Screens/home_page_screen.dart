import 'package:flutter/material.dart';
import 'package:memo_app/DataBase/database_list.dart';
import 'package:memo_app/Screens/bottom_sheet_page.dart';
import 'package:memo_app/Widgets/memo_tile.dart';
import 'package:memo_app/Widgets/pop_up_menu_button.dart';
import '../Widgets/drawer_widget.dart';

DataBaseList dbList = DataBaseList();

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  var note = "Title";
  var bodyNote = "Body";
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => BottomSheetPage(
              body: bodyController,
              title: titleController,
              onPressed: () {
                note = titleController.text;
                bodyNote = bodyController.text;
                setState(() {});
                Navigator.pop(context);
                titleController.clear();
                bodyController.clear();
                // Adding the Memo
              },
            ),
          );
        },
        child: const Icon(Icons.create),
      ),
      backgroundColor: const Color.fromARGB(255, 202, 199, 199),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        actions: [
          PopUpMenuButton(
            deleteOnPressed: (value) {
              if (value == 0) {
                dbList.memoes.clear();
              }
              setState(() {});
            },
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Memo App"),
            const SizedBox(width: 5),
            Text(
              "Flutter",
              style: TextStyle(
                color: Colors.blue[600],
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: dbList.memoes.isEmpty == true ? 1 : dbList.memoes.length,
        itemBuilder: (context, index) {
          return dbList.memoes.isEmpty == true
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6),
                        ),
                        child: Image.asset(
                          'images/eren.jpg',
                          height: 140,
                        ),
                      ),
                    ),
                    const Text(
                      'No Note',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              : MemoTile(
                  onPressed: (value) {
                    // Removing the Memo,
                    dbList.memoes.removeAt(index);
                    setState(() {});
                  },
                  title: dbList.memoes[index].titleModule,
                  body: dbList.memoes[index].bodyModule,
                );
        },
      ),
    );
  }
}
