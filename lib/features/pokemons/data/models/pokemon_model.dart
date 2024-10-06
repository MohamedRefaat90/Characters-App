import 'dart:convert';

class PokemonModel {
  final int id;
  final String name;
  final String description;
  final List type;
  final String image;
  PokemonModel({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.image,
  });

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      type: List<String>.from(
        (map['type'] as List),
      ),
      image: map['image'] as String,
    );
  }

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
