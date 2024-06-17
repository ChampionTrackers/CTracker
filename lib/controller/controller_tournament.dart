import 'dart:convert';

import 'package:ctracker/constants/config.dart';
import 'package:ctracker/model/match_model.dart';
import 'package:ctracker/model/team_model.dart';
import 'package:ctracker/model/tournament_model.dart';
import 'package:http/http.dart' as http;

class TournamentController {
  Future<Tournament> fetchTournamentDetails(int id) async {
    final uriChampionship =
        Uri.parse("${Config.apiBaseUrl}/v1/championships/$id");

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

  Future<List<Match>> fetchMatches(int tournamentId) async {
    final response = await http.get(
      Uri.parse('${Config.apiBaseUrl}/v1/championships/$tournamentId/matches'),
    );

    if (response.statusCode == 200) {
      List<dynamic> matchesJson = json.decode(response.body);
      List<Match> matches =
          matchesJson.map((json) => Match.fromJson(json)).toList();
      return matches;
    } else {
      throw Exception('Failed to load matches');
    }
  }
}
