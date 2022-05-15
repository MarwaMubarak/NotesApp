class UserHub{
  String? email;
  String? password;
  String? accessToken;
  String? firstName;
  String? lastName;

  UserHub.formJson(Map<String ,dynamic> jsonData){
    email = jsonData["Email"];
    password = jsonData['Password'];
    accessToken = jsonData["_id"];
    firstName=jsonData["Firstname"];
    lastName=jsonData["Lastname"];
  }

}