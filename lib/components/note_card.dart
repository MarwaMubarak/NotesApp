import 'package:flutter/material.dart';
import 'package:notes_app/models/note_hub.dart';
class NoteCard extends StatelessWidget {

Note note;
DateTime date;
   NoteCard({required this.note,required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 100,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(20),


      ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(note.noteTitle!.length==0?'No Title':note.noteTitle!,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,),overflow: TextOverflow.ellipsis,textAlign:TextAlign.left,maxLines: 1,),
              Text(note.noteBody!.length==0?'No content':note.noteBody!,style:TextStyle(color: Colors.white,fontSize: 10,),overflow: TextOverflow.ellipsis,textAlign:TextAlign.left,maxLines: 1,),
              SizedBox(
                height: 5,
              ),
              Text('created ${date}',style:TextStyle(color: Colors.white,fontSize: 9,),overflow: TextOverflow.ellipsis,textAlign:TextAlign.left,maxLines: 1,)

            ],
          ),
        ),

    );
  }

}
