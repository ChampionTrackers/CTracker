import 'dart:convert';

import 'package:ctracker/utils/verify_jwt.dart';
import 'package:http/http.dart' as http;

class GuessController {
  Future<void> makeGuess(int matchId, int teamId, double guessCost) async {
    var jwt = await verifyJwt();

    final response = await http.post(
      Uri.parse('https://ctracker-server.onrender.com/v1/guesses'),
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

    if (response.statusCode == 201) {
      // Sucesso
      print('Palpite realizado com sucesso');
    } else {
      // Falha
      final errorResponse = jsonDecode(response.body);
      throw Exception(errorResponse['message']);
    }
  }
}
