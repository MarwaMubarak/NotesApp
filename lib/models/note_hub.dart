class NoteHub {
 List<Note> notes=[];
 NoteHub({required this.notes});
 NoteHub.fromJson(List<dynamic> list) {
  list.forEach((element) {
    notes.add(Note.fromJson(element));
  });
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
  int? iV;

  Note({required this.id, required this.noteTitle, required this.noteBody,required this.noteDate});
  Note.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    noteTitle = json['NoteTitle'];
    noteBody = json['NoteBody'];
    noteDate = json['NoteDate'];
    iV = json['__v'];
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
