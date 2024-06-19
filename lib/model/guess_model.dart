class Guess {
  final int id;
  final String teamName;
  final String championshipName;
  final int guessCost;

  Guess({
    required this.id,
    required this.teamName,
    required this.championshipName,
    required this.guessCost,
  });

  factory Guess.fromJson(Map<String, dynamic> json) {
    return Guess(
      id: json['id'],
      teamName: json['teamName'],
      championshipName: json['championship']['name'],
      guessCost: json['guessCost'],
    );
  }
}
