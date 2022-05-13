class UserHub{
  String? email;
  String? password;
  String? accessToken;

  UserHub.formJson(Map<String ,dynamic> jsonData){
    email = jsonData['email'];
    password = jsonData['password'];
    accessToken = jsonData['accessToken'];
  }

}