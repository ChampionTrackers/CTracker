import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<String> verifyJwt() async {
  final storage = FlutterSecureStorage();
  var jwt = await storage.read(key: "jwt");
  if (jwt == null) return "";
  return jwt;
}
