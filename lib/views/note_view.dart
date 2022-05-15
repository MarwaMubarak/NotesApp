import 'package:flutter/material.dart';
import 'package:notes_app/main.dart';
import 'package:notes_app/models/note_hub.dart';
import 'package:notes_app/views/home_view.dart';
class NoteView extends StatelessWidget {

 final _titleController =TextEditingController();
  final _bodyController =TextEditingController();

  NoteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  width: 350,
                  child: TextField(
                    controller: _titleController,
                    cursorColor: Colors.white70,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(

                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: 'Title',
                        hintStyle: TextStyle( color: Colors.white70,),
                      prefixIcon: Icon(Icons.add,color:Colors.white70)

                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  width: 350,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: _bodyController,
                    cursorColor: Colors.white70,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: 'Add Note ',
                        hintStyle: TextStyle( color: Colors.white70,),
                        prefixIcon: Icon(Icons.message,color:Colors.white70)
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xffe2cde3),
              ),
              onPressed: () {
                NoteHub newNote=NoteHub(title: _titleController.text==''?'No Tiltle':_titleController.text, message:_bodyController.text==''?'No Content':_bodyController.text);
                NotesList.add(newNote);
                NotesList=NotesList.reversed.toList();
                _bodyController.clear();
                _titleController.clear();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeView()),
                );
              },
              child: Icon(Icons.add,color: Colors.black,),
            ),
          ],
        ),
      ),
    );
  }
}
