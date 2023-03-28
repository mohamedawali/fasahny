class RegisterModel {
  String? username;
  String? email;
  String? password;

  RegisterModel(this.username, this.email, this.password);

  Map<String, dynamic> saveMap() =>
      {'username': username, 'email': email, 'password': password};
  RegisterModel.getMap(Map<String,dynamic>map){
    username = map["username"];
    email = map["email"];
    password = map["password"];
  }

}
