import 'dart:convert';

import 'package:ctracker/model/team_model.dart';
import 'package:ctracker/model/tournament_model.dart';
import 'package:ctracker/model/user_model.dart';
import 'package:http/http.dart' as http;

class TournamentController {
  Future<Tournament> fetchTournamentDetails(int id) async {
    final uriChampionship =
        Uri.https("ctracker-server.onrender.com", "/v1/championships/$id");

    final response = await http.get(
      uriChampionship,
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Tournament.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load championship");
    }
  }

  Future<List<Team>> fetchTeams(int id) async {
    final uriTeams = Uri.https(
        "ctracker-server.onrender.com", "/v1/championships/$id/teams");

    final response = await http.get(
      uriTeams,
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<Team> teams = [];
      for (var team in json.decode(response.body)) {
        teams.add(Team.fromJson(team));
      }
      return teams;
    } else {
      throw Exception("Failed to load teams");
    }
  }
}
