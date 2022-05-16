class NoteHub {
  String? sId;
  String? noteTitle;
  String? noteBody;
  String? noteDate;
  int? iV;

  NoteHub({this.sId, this.noteTitle, this.noteBody, this.noteDate, this.iV});

  NoteHub.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    noteTitle = json['NoteTitle'];
    noteBody = json['NoteBody'];
    noteDate = json['NoteDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['NoteTitle'] = this.noteTitle;
    data['NoteBody'] = this.noteBody;
    data['NoteDate'] = this.noteDate;
    data['__v'] = this.iV;
    return data;
  }
}


// class NoteHub{
//   String? title;
//   String? message;
//   DateTime? date;
//   String? id;
//
//
//   NoteHub({required this.title,required this.message,required this.date,required this.id});
//
//   NoteHub.fromJson(Map< String,dynamic >jsonData){
//     title = jsonData["NoteTitle"];
//     message = jsonData["NoteBody"];
//     id=jsonData["_id"];
//     date=jsonData["NoteDate"];
//   }
//
// }