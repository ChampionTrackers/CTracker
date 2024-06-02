import 'package:ctracker/model/team_model.dart';
import 'package:ctracker/model/user_model.dart';
import 'package:intl/intl.dart';

class Tournament {
  int? id;
  String? name;
  User? owner;
  String? description;
  String? picture;
  String? type;
  String? game;
  String? createdAt;
  int? teamsAmount;
  List<Team>? teams;

  Tournament(
      {this.id,
      this.name,
      this.owner,
      this.description,
      this.picture,
      this.type,
      this.game,
      this.createdAt,
      this.teamsAmount});

  Tournament.fromJson(Map<String, dynamic> json,
      {User? owner, List<Team>? teams}) {
    id = json['id'];
    name = json['name'];
    owner = json['owner'];
    description = json['description'];
    picture = json['picture'];
    type = json['type'];
    game = json['game'];
    createdAt =
        DateFormat('dd/MM/yyyy').format(DateTime.parse(json['createdAt']));
    teamsAmount = json['teamsAmount'];
    teams = teams;
    owner = owner;
  }
}
