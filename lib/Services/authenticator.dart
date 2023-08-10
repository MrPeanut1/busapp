import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Authenticator {
  String apiUrl = const String.fromEnvironment("API_URL");
  static bool loggedIn = false;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<bool> login(
      String username, password, Function? loginUpdateStatus) async {

    bool result = await getSessionToken(username, password);

    if (result) {
      return true;
    }

    return false;
  }

  Future<void> logout() async {
    await deleteSession();
  }

  Future<bool> getSessionToken(username, password) async {
    try {

      Uri url = Uri.parse("$apiUrl/login").replace(queryParameters: {
        "username": username,
        "password": password,
      });

      var res = await http.get(url);

      if (res.statusCode == 200) {
        var response = json.decode(res.body);
        var sessionToken = response['sessionToken'];
        await storeSession(sessionToken, username);

        return true;
      }

      if (res.statusCode == 401) {
        Fluttertoast.showToast(
            msg: "Password or Username Incorrect",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            // backgroundColor: Colors.red,
            // textColor: Colors.white,
            fontSize: 16.0);
      }

      if (res.statusCode == 404) {
        Fluttertoast.showToast(
            msg: "User not found",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            // backgroundColor: Colors.red,
            // textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (err) {
      Fluttertoast.showToast(
          msg: "Network Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          // backgroundColor: Colors.red,
          // textColor: Colors.white,
          fontSize: 16.0);
    }
    return false;
  }

  Future<bool> isLogedIn() async {
    if (await getSession() == null) {
      loggedIn = false;
      return false;
    }
    loggedIn = true;
    return true;
  }

  Future<void> storeSession(sessionToken, username) async {
    await storage.write(key: 'sessionToken', value: sessionToken);
    await storage.write(key: 'username', value: username);
    loggedIn = true;
  }

  Future<String?> getSession() async {
    var sessionToken = await storage.read(key: 'sessionToken');
    return sessionToken;
  }

  Future<String?> getUsername() async {
    var username = await storage.read(key: 'username');
    return username;
  }

  Future<void> deleteSession() async {
    await storage.delete(key: 'sessionToken');
    loggedIn = false;
  }

  bool getLoginState() {
    return loggedIn;
  }
}
