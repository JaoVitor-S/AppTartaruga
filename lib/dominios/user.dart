class User {
  late String username;
  late String password;

  User(this.username, this.password);

  // Construtor nomeado seguindo o padrão do professor
  User.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["username"] = username;
    json["password"] = password;
    return json;
  }
}