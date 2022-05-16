import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/blocs/note/note_cubit.dart';
import 'package:notes_app/main.dart';
import 'package:notes_app/models/note_hub.dart';
import 'package:notes_app/services/sp_screen/cache_helper.dart';
import 'package:notes_app/views/home_view.dart';

import '../blocs/user/user_cubit.dart';

class NoteView extends StatelessWidget {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  NoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, NoteState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var noteCubit = NoteCubit.get(context);
        return Scaffold(
            resizeToAvoidBottomInset: false,
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
                            borderRadius: BorderRadius.circular(20)),
                        width: 350,
                        child: TextField(
                          controller: _titleController,
                          cursorColor: Colors.white70,
                          style: TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: 'Title',
                              hintStyle: TextStyle(
                                color: Colors.white70,
                              ),
                              prefixIcon:
                                  Icon(Icons.add, color: Colors.white70)),
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
                            borderRadius: BorderRadius.circular(20)),
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
                              hintStyle: TextStyle(
                                color: Colors.white70,
                              ),
                              prefixIcon:
                                  Icon(Icons.message, color: Colors.white70)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffe2cde3),
                    ),
                    onPressed: () {
                      String date =
                          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} - ${DateTime.now().hour}:${DateTime.now().minute}';
                      Note newNote = Note(
                          noteTitle: _titleController.text,
                          noteBody: _bodyController.text,
                          noteDate: date,
                          id: SharedPreferencesHelper.getData(key: 'token'));
                      noteCubit.noteHub!.notes.add(newNote);
                      noteCubit.noteHub!.notes.reversed.toList();
                      _bodyController.clear();
                      _titleController.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView()),
                      );
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
