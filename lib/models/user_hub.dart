class UserHub {
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  int? iV;

  UserHub(
      {this.id,
        this.firstname,
        this.lastname,
        this.email,
        this.password,
        this.iV});

   UserHub.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstname = json['Firstname'];
    lastname = json['Lastname'];
    email = json['Email'];
    password = json['Password'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['Firstname'] = this.firstname;
    data['Lastname'] = this.lastname;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['__v'] = this.iV;
    return data;
  }


}
