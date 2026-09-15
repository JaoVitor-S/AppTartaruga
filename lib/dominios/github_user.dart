class GithubUser {
  late String login;
  late String avatarUrl;
  late String name;
  late String bio;
  late int publicRepos;
  late int followers;

  GithubUser({
    required this.login,
    required this.avatarUrl,
    required this.name,
    required this.bio,
    required this.publicRepos,
    required this.followers,
  });

  GithubUser.fromJson(Map<String, dynamic> json) {
    login = json['login'] ?? '';
    avatarUrl = json['avatar_url'] ?? '';
    name = json['name'] ?? json['login'] ?? '';
    bio = json['bio'] ?? 'Sem biografia cadastrada no GitHub.';
    publicRepos = json['public_repos'] ?? 0;
    followers = json['followers'] ?? 0;
  }
}