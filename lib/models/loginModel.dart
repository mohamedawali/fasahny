class LoginModel {

  String? email;
  String? password;

  LoginModel( this.email, this.password);

  Map<String, dynamic> saveMap() =>
      { 'email': email, 'password': password};
  LoginModel.getMap(Map<String,dynamic>map){

    email = map["email"];
    password = map["password"];
  }

}
