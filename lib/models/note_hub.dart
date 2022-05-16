class NoteHub {
 List<Note> notes=[];
 NoteHub({required this.notes});
 NoteHub.fromJson(json) {
   if (json['note'] != null) {
     notes = <Note>[];
     json['note'].forEach((v) {
       notes.add(new Note.fromJson(v));
     });
   }
 }

 Map<String, dynamic> toJson() {
   final Map<String, dynamic> data = new Map<String, dynamic>();
   data['note'] = this.notes.map((v) => v.toJson()).toList();
   return data;
 }

}
class Note
{
  String? id;
  String? noteTitle;
  String? noteBody;
  String? noteDate;

  Note(this.id, this.noteTitle, this.noteBody, this.noteDate);
  Note.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    noteTitle = json['NoteTitle'];
    noteBody = json['NoteBody'];
    noteDate = json['NoteDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['NoteTitle'] = this.noteTitle;
    data['NoteBody'] = this.noteBody;
    data['NoteDate'] = this.noteDate;
    return data;
  }
}
