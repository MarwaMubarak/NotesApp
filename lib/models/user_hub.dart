class UserHub {
  String? sId;
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  int? iV;

  UserHub(
      {this.sId,
        this.firstname,
        this.lastname,
        this.email,
        this.password,
        this.iV});

   UserHub.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstname = json['Firstname'];
    lastname = json['Lastname'];
    email = json['Email'];
    password = json['Password'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Firstname'] = this.firstname;
    data['Lastname'] = this.lastname;
    data['Email'] = this.email;
    data['Password'] = this.password;
    data['__v'] = this.iV;
    return data;
  }


}
