import "dart:convert";

import "package:ctracker/model/user_model.dart";
import "package:ctracker/utils/verify_jwt.dart";
import "package:flutter/foundation.dart";
import "package:http/http.dart" as http;
import "package:flutter_secure_storage/flutter_secure_storage.dart";

class ProfileController {
  final storage = const FlutterSecureStorage();

  Future<User> fetchProfile() async {
    var jwt = await verifyJwt();
    if (kDebugMode) print("JWT: $jwt");

    // Fetch profile data from API
    var res = await http.get(
        Uri.parse("https://ctracker-server.onrender.com/v1/profile"),
        headers: {
          "Content-Type": "application/json",
          'Accept': 'application/json',
          "Authorization": "Bearer $jwt"
        });

    if (res.statusCode == 200) {
      if (kDebugMode) print("Response: ${res.body}");
      return User.fromJson(json.decode(res.body) as Map<String, dynamic>);
    } else {
      throw Exception("Request failed with status: ${res.statusCode}");
    }
  }
}
