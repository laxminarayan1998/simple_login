class User {
  String? name;
  String? password;
  String? email;
  String? phoneNo;
  String? profession;

  User({this.name, this.password, this.email, this.phoneNo, this.profession});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
    email = json['email'];
    phoneNo = json['phoneNo'];
    profession = json['profession'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['password'] = this.password;
    data['email'] = this.email;
    data['phoneNo'] = this.phoneNo;
    data['profession'] = this.profession;
    return data;
  }
}
