// ignore_for_file: public_member_api_docs, sort_constructors_first
class PokemonModel {
  int id;
  String name;
  String img;
  List<dynamic> abilities;
  int baseExperience;
  int height;
  int weight;
  bool isFavourite;
  PokemonModel({
    required this.id,
    required this.name,
    required this.img,
    required this.abilities,
    required this.baseExperience,
    required this.height,
    required this.weight,
    this.isFavourite = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'img': img,
      'abilities': abilities,
      'base_experience': baseExperience,
      'height': height,
      'weight': weight,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id'] as int,
      name: map['name'] as String,
      img: map['sprites']['versions']['generation-ii']['crystal']['front_default'],
      abilities: map['abilities'].map((ability) => ability['ability']['name']).toList(),
      baseExperience: map['base_experience'] as int,
      height: map['height'] as int,
      weight: map['weight'] as int,
    );
  }

  factory PokemonModel.fromLocalMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id'] as int,
      name: map['name'] as String,
      img: map['img'] as String,
      abilities: map['abilities'] as List<dynamic>,
      baseExperience: map['base_experience'] as int,
      height: map['height'] as int,
      weight: map['weight'] as int,
    );
  }

  PokemonModel copyWith({
    int? id,
    String? name,
    String? img,
    List<dynamic>? abilities,
    int? baseExperience,
    int? height,
    int? weight,
    bool? isFavourite,
  }) {
    return PokemonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      img: img ?? this.img,
      abilities: abilities ?? this.abilities,
      baseExperience: baseExperience ?? this.baseExperience,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}
