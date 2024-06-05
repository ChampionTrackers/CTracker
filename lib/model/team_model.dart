class Team {
  int? id;
  String? name;
  String? picture;
  int? victory;
  int? defeat;
  int? draw;
  Team(
      {this.id, this.name, this.picture, this.victory, this.defeat, this.draw});

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    victory = json['victory'];
    defeat = json['defeat'];
    draw = json['draw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['picture'] = picture;
    data['victory'] = victory;
    data['defeat'] = defeat;
    data['draw'] = draw;
    return data;
  }
}
