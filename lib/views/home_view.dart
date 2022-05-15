import 'package:flutter/material.dart';
import 'package:notes_app/components/note_card.dart';
import 'package:notes_app/main.dart';

import 'note_view.dart';
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoteView()),
        );
          },
        child: Icon(Icons.add,color: Colors.black,),
        backgroundColor: Color(0xfffae2fc),
      ),
      body: NotesList.length==0?
          Container(
            color: Colors.black,
            child:
            Center(child: Text('No Notes added yet..',style: TextStyle(color: Colors.white,fontSize: 20),)),
          )
          :Container(
          color: Colors.black,
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: NotesList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: NoteCard(note: NotesList[index],date: DateTime.now(),)
              );
            }
        ),
      ),
    );
  }
}
