class NoteHub{
  String? title;
  String? message;
  String? date;
  String? id;


  NoteHub({required this.title,required this.message,required this.date,required this.id});

  NoteHub.fromJson(Map< String,dynamic >jsonData){
    title = jsonData["NoteTitle"];
    message = jsonData["NoteBody"];
    id=jsonData["_id"];
    date=jsonData["NoteDate"];
  }

}