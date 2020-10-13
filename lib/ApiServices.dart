import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:login2/LoginModel.dart';

class ApiServices {
  static Future<LoginModel> connectToApi(String email, String password) async {
    String apiUrl =
        "http://falconlink.id:8069/api/ver2/falcon/transporter/login";

    Map credential = {'email': email, 'password': password};
    var body = json.encode(credential);
    var apiResult = await http.post(apiUrl,
        body: body, headers: {"apikey": "7e538d939edea95cfb2d32d2da8e5dbf"});

    var jsonObject = json.decode(apiResult.body);
    print(jsonObject);

    var relationData = jsonObject['data'];
    String myName = relationData[0]['key'].toString();
    String myId = relationData[0]['id'].toString();
    // print(myName);

    return LoginModel.createdPostResult(jsonObject['data']);
  }
}

class ApiServices2 {
  static Future<LoginModel> connectToApi(String id, String key) async {
    print(key);
    print(id);
    String apiUrl =
        "http://falconlink.id:8069/api/ver2/falcon/transporter/driver?id=" +
            id +
            "&session=" +
            key;

    var apiResult = await http.get(Uri.encodeFull(apiUrl),
        headers: {"apikey": "7e538d939edea95cfb2d32d2da8e5dbf"});
    print(apiResult.body);
    var jsonObject = json.decode(apiResult.body);
    print(jsonObject);

    // var relationData = jsonObject['data'];
    // String myName = relationData[0]['key'].toString();
    // print(myName);

    return LoginModel.createdPostResult(jsonObject['data']);
  }
}

class ApiServices3 {
  static Future<LoginModel> connectToApi(
      String id, String key, String idDriver) async {
    print(key);
    print(id);
    String apiUrl =
        "http://falconlink.id:8069/api/ver2/falcon/transporter/driverdetail?id=" +
            id +
            "&session=" +
            key +
            "&driverid=" +
            idDriver;

    var apiResult = await http.get(Uri.encodeFull(apiUrl),
        headers: {"apikey": "7e538d939edea95cfb2d32d2da8e5dbf"});
    print(apiResult.body);
    var jsonObject = json.decode(apiResult.body);
    print(jsonObject);

    // var relationData = jsonObject['data'];
    // String myName = relationData[0]['key'].toString();
    // print(myName);

    return LoginModel.createdPostResult(jsonObject['data']);
  }
}
