// ignore_for_file: public_member_api_docs, sort_constructors_first
class PokemonModel {
  int id;
  String name;
  List<String> abilities;
  String baseExperience;
  int height;
  int width;
  PokemonModel({
    required this.id,
    required this.name,
    required this.abilities,
    required this.baseExperience,
    required this.height,
    required this.width,
  });
}
