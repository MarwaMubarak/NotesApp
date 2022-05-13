class NoteHub{
  String? title;
  String? message;

  NoteHub.fromJson(Map< String,dynamic >jsonData){
    title = jsonData["title"];
    message = jsonData["message"];
  }

}