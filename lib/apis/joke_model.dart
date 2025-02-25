import 'dart:convert';

class JokeModel {
  String category;
  String type;
  String joke;
  JokeModel({
    required this.category,
    required this.type,
    required this.joke,
  });

  JokeModel copyWith({
    String? category,
    String? type,
    String? joke,
  }) {
    return JokeModel(
      category: category ?? this.category,
      type: type ?? this.type,
      joke: joke ?? this.joke,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'type': type,
      'joke': joke,
    };
  }

  factory JokeModel.fromMap(Map<String, dynamic> map) {
    return JokeModel(
      category: map['category'] as String,
      type: map['type'] as String,
      joke: map['joke'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JokeModel.fromJson(String source) => JokeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'JokeModel(category: $category, type: $type, joke: $joke)';

  @override
  bool operator ==(covariant JokeModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.category == category &&
      other.type == type &&
      other.joke == joke;
  }

  @override
  int get hashCode => category.hashCode ^ type.hashCode ^ joke.hashCode;
}
