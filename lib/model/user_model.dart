class User {
  String? email;
  String? name;
  String? nickname;
  String? picture;
  int? score;

  User({this.email, this.name, this.nickname, this.picture, this.score});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    nickname = json['nickname'];
    picture = json['picture'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['nickname'] = nickname;
    data['picture'] = picture;
    data['score'] = score;
    return data;
  }
}
