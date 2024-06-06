import 'dart:convert';

import 'package:ctracker/model/tournament_model.dart';
import 'package:http/http.dart' as http;

class HomeController {
  Future<List<Tournament>> fetchTournament() async {
    final queryParams = {
      "page": "0",
      "pageSize": "5",
    };

    final uri = Uri.https(
        "ctracker-server.onrender.com", "/v1/championships", queryParams);

    final res = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
      },
    );

    if (res.statusCode == 200) {
      List body = json.decode(res.body);
      return body.map((item) => Tournament.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load championships");
    }
  }
}
