import 'dart:convert';
import 'package:get/get.dart';

import 'package:poke_man/models/pokemon_model.dart';
import 'package:poke_man/services/image_service.dart';
import 'package:poke_man/utils/app_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_client.dart';
import '../api/api_routes.dart';

class PokemonRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  PokemonRepo({required this.apiClient, required this.sharedPreferences});

  List<String> pokemons = [];

  Future<bool> addToPokemonLocalStorage(List<PokemonModel> body) async {
    pokemons = [];
    pokemons = body.map((pokemon) {
      _savePokemonImages(pokemon.img, pokemon.name);
      return json.encode(pokemon.toMap());
    }).toList();

    return await sharedPreferences.setStringList(AppKeys.pokemonList, pokemons);
  }

  Future<List<PokemonModel>> getPokemonListFromLocalStorage() async {
    pokemons = [];

    if (sharedPreferences.containsKey(AppKeys.pokemonList)) {
      pokemons = sharedPreferences.getStringList(AppKeys.pokemonList)!;
    }

    List<PokemonModel> pokemonList = [];

    pokemonList = pokemons.map((pokemon) {
      Map<String, dynamic> map = json.decode(pokemon);
      return PokemonModel.fromLocalMap(map);
    }).toList();

    return pokemonList;
  }

  Future<bool> clearPokemonLocalStorage() {
    return sharedPreferences.remove(AppKeys.pokemonList);
  }

  bool checkPokemonLocalStorage() {
    return sharedPreferences.containsKey(AppKeys.pokemonList);
  }

  void _savePokemonImages(String imageUrl, String name) async {
    await ImageService().saveNetworkImageToGallery(imageUrl, name);
  }

  // API Calls to Pokemon Server
  Future<Response> getPokemonList() async {
    return await apiClient.getData(APIRoutes.getPokemonListURL());
  }

  Future<Response> getPokemonDetails(String pokemonName) async {
    return await apiClient.getData(APIRoutes.getPokemonURL(pokemonName));
  }
}
