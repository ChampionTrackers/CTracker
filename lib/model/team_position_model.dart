import 'dart:convert';

class TeamPosition {
  final int teamId;
  final String teamName;
  final int wins;
  final int losses;
  final int draws;
  final int points;

  TeamPosition({
    required this.teamId,
    required this.teamName,
    required this.wins,
    required this.losses,
    required this.draws,
    required this.points,
  });

  factory TeamPosition.fromRawJson(String str) =>
      TeamPosition.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TeamPosition.fromJson(Map<String, dynamic> json) => TeamPosition(
        teamId: json["teamId"],
        teamName: json["teamName"],
        wins: json["wins"],
        losses: json["losses"],
        draws: json["draws"],
        points: json["points"],
      );

  Map<String, dynamic> toJson() => {
        "teamId": teamId,
        "teamName": teamName,
        "wins": wins,
        "losses": losses,
        "draws": draws,
        "points": points,
      };
}
