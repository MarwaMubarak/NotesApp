import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/blocs/note/note_cubit.dart';
import 'package:notes_app/components/note_card.dart';

import 'note_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        NoteCubit.get(context).getAllNotes();
        return BlocConsumer<NoteCubit, NoteState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var notes =NoteCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NoteView()),
                  );
                },
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                backgroundColor: Color(0xfffae2fc),
              ),
              body:
                  Container(
                color: Colors.black,
                child:  state is NoteLoadingState
                ? Center(
                      child: CircularProgressIndicator(

                  ),
            ):ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: notes.noteHub!.notes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.all(8),
                          child: NoteCard(
                            note: notes.noteHub!.notes[index],
                            date: DateTime.now(),
                          ));
                    }),
              ),
            );
          },
        );
      }
    );
  }
}
