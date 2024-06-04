import 'package:intl/intl.dart';

class Tournament {
  int? id;
  String? name;
  String? picture;
  String? description;
  String? type;
  String? createdAt;
  int? teamsAmount;
  String? game;
  Owner? owner;

  Tournament(
      {this.id,
      this.name,
      this.picture,
      this.description,
      this.type,
      this.createdAt,
      this.teamsAmount,
      this.game,
      this.owner});

  Tournament.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    description = json['description'];
    type = json['type'];
    createdAt = DateFormat('dd/MM/yyyy').format(DateTime.parse(json['createdAt']));
    teamsAmount = json['teamsAmount'];
    game = json['game'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['picture'] = picture;
    data['description'] = description;
    data['type'] = type;
    data['createdAt'] = createdAt;
    data['teamsAmount'] = teamsAmount;
    data['game'] = game;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    return data;
  }
}

class Owner {
  int? id;
  String? nickname;
  String? picture;

  Owner({this.id, this.nickname, this.picture});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nickname = json['nickname'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nickname'] = nickname;
    data['picture'] = picture;
    return data;
  }
}
