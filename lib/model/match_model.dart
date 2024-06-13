class Match {
  final int id;
  final MatchTeam homeTeam;
  final MatchTeam awayTeam;
  final DateTime plannedStartTime;
  final String status;

  Match({
    required this.id,
    required this.homeTeam,
    required this.awayTeam,
    required this.plannedStartTime,
    required this.status,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      id: json['id'],
      homeTeam: MatchTeam.fromJson(json['homeTeam']),
      awayTeam: MatchTeam.fromJson(json['awayTeam']),
      plannedStartTime: DateTime.parse(json['plannedStartTime']),
      status: json['status'],
    );
  }
}

class MatchTeam {
  final int id;
  final String name;
  final String picture;
  final int score;

  MatchTeam({
    required this.id,
    required this.name,
    required this.picture,
    required this.score,
  });

  factory MatchTeam.fromJson(Map<String, dynamic> json) {
    return MatchTeam(
      id: json['id'],
      name: json['name'],
      picture: json['picture'],
      score: json['score'],
    );
  }
}
