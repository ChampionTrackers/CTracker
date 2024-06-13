import 'dart:convert';

import 'package:ctracker/model/guess_model.dart';
import 'package:ctracker/utils/verify_jwt.dart';
import 'package:http/http.dart' as http;

class FeedController {
  Future<List<Guess>> fetchGuesses() async {
    var jwt = await verifyJwt();

    final response = await http.get(
      Uri.parse('https://ctracker-server.onrender.com/v1/guesses'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $jwt',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((guess) => Guess.fromJson(guess)).toList();
    } else {
      throw Exception('Failed to load guesses');
    }
  }
}
