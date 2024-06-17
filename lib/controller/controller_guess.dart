import 'dart:convert';

import 'package:ctracker/constants/config.dart';
import 'package:ctracker/utils/verify_jwt.dart';
import 'package:http/http.dart' as http;

class GuessController {
  Future<void> makeGuess(int matchId, int teamId, double guessCost) async {
    var jwt = await verifyJwt();

    final response = await http.post(
      Uri.parse('${Config.apiBaseUrl}/v1/guesses'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
      },
      body: jsonEncode({
        'matchId': matchId,
        'teamId': teamId,
        'guessCost': guessCost,
      }),
    );

    if (response.statusCode != 201) {
      // Falha
      final errorResponse = jsonDecode(response.body);
      throw Exception(errorResponse['message']);
    }
  }
}
