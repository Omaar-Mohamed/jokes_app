class Joke {
  final bool? error;
  final String? category;
  final String? type;
  final String? setup;
  final String? delivery;
  final bool? nsfw;
  final bool? religious;
  final bool? political;
  final bool? racist;
  final bool? sexist;
  final bool? explicit;
  final bool? safe;
  final int? id;
  final String? lang;
  final String? joke;

  Joke({
    this.error,
    this.category,
    this.type,
    this.setup,
    this.delivery,
    this.nsfw,
    this.religious,
    this.political,
    this.racist,
    this.sexist,
    this.explicit,
    this.safe,
    this.id,
    this.lang,
    this.joke,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      error: json['error'] as bool?,
      category: json['category'] as String?,
      type: json['type'] as String?,
      setup: json['setup'] as String?,
      delivery: json['delivery'] as String?,
      nsfw: json['flags']['nsfw'] as bool?,
      religious: json['flags']['religious'] as bool?,
      political: json['flags']['political'] as bool?,
      racist: json['flags']['racist'] as bool?,
      sexist: json['flags']['sexist'] as bool?,
      explicit: json['flags']['explicit'] as bool?,
      safe: json['safe'] as bool?,
      id: json['id'] as int?,
      lang: json['lang'] as String?,
      joke: json['joke'] as String?,
    );
  }
}
