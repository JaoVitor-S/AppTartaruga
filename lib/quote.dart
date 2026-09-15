class Quote {
  final int id;
  final String text;
  final String author;

  Quote({
    required this.id,
    required this.text,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      id: json['id'],
      text: json['quote'] ?? '',
      author: json['author'] ?? 'Desconhecido',
    );
  }
}