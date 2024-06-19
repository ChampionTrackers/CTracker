import 'dart:convert';

class User {
  String? email;
  String? name;
  String? nickname;
  String? picture;
  int? score;
  int? balance;
  int? highestGuess;
  int? totalEarnings;
  int? totalLosses;
  String? lastTeamGuessedAt;
  int? totalGuesses;

  User({
    this.email,
    this.name,
    this.nickname,
    this.picture,
    this.score,
    this.balance,
    this.highestGuess,
    this.totalEarnings,
    this.totalLosses,
    this.lastTeamGuessedAt,
    this.totalGuesses,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        name: json["name"],
        nickname: json["nickname"],
        picture: json["picture"],
        score: json["score"],
        balance: json["balance"],
        highestGuess: json["highestGuess"],
        totalEarnings: json["totalEarnings"],
        totalLosses: json["totalLosses"],
        lastTeamGuessedAt: json["lastTeamGuessedAt"],
        totalGuesses: json["totalGuesses"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "nickname": nickname,
        "picture": picture,
        "score": score,
        "balance": balance,
        "highestGuess": highestGuess,
        "totalEarnings": totalEarnings,
        "totalLosses": totalLosses,
        "lastTeamGuessedAt": lastTeamGuessedAt,
        "totalGuesses": totalGuesses,
      };
}
