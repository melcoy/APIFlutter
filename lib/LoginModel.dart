class LoginModel {
  String id;
  String key;
  String nama;

  LoginModel({this.id, this.key, this.nama});

  factory LoginModel.createdPostResult(List<dynamic> object) {
    return LoginModel(
        id: object[0]['id'].toString(),
        key: object[0]['key'],
        nama: object[0]['nama']);
  }
}
