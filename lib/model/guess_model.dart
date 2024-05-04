class Guess {
  String? teamName;
  String? championshipName;
  int? ctCoins;

  Guess({this.teamName, this.championshipName, this.ctCoins});

  Guess.fromJson(Map<String, dynamic> json) {
    teamName = json['teamName'];
    championshipName = json['championshipName'];
    ctCoins = json['CTCoins'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teamName'] = teamName;
    data['championshipName'] = championshipName;
    data['CTCoins'] = ctCoins;
    return data;
  }
}
