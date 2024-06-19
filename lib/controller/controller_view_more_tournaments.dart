import 'dart:convert';

import 'package:ctracker/constants/config.dart';
import 'package:ctracker/model/tournament_model.dart';
import 'package:http/http.dart' as http;

class MoreTournamentsController {
  Future<List<Tournament>> fetchTournament(int page) async {
    final queryParams = {
      "page": page.toString(),
      "pageSize": "10",
    };

    final uri = Uri.https(Config.apiHost, "/v1/championships", queryParams);

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
