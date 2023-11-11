import 'package:get/get.dart';
import 'package:poke_man/data/repo/pokemon_repo.dart';
import 'package:poke_man/models/pokemon_model.dart';
import 'package:poke_man/services/image_service.dart';

class PokemonController extends GetxController {
  final PokemonRepo pokemonRepo;
  PokemonController({required this.pokemonRepo});

  List<PokemonModel> _pokemonList = [];
  List<PokemonModel> get pokemonList => _pokemonList;

  final List<String> _pokemonNameList = [];

  bool _isloading = false;
  bool get isloading => _isloading;

  String _status = 'fetching..';
  String get status => _status;

  void addToSaved(PokemonModel savePokemon) {
    for (int i = 0; i < _pokemonList.length; i++) {
      if (savePokemon.id == _pokemonList[i].id) {
        _pokemonList[i] = savePokemon;
        break;
      }
    }
    update();
  }

  Future<bool> getPokemonList() async {
    _isloading = true;

    bool isLocalStorageDataAvailable = pokemonRepo.checkPokemonLocalStorage();

    if (isLocalStorageDataAvailable) {
      _status = 'Fetching from local Strorage';
      update();

      await Future.delayed(const Duration(seconds: 2));
      _pokemonList = await pokemonRepo.getPokemonListFromLocalStorage();
      return true;
    } else {
      _status = 'Fetching from Pokemon Server...';
      update();
      Response pokemonNameResponse = await pokemonRepo.getPokemonList();

      if (pokemonNameResponse.body is Map<String, dynamic>) {
        Map<String, dynamic> pokemonNameData = pokemonNameResponse.body;

        var pokemonNameList = pokemonNameData['results'];
        for (var item in pokemonNameList) {
          var name = item['name'];
          _pokemonNameList.add(name);
        }

        for (String pokemon in _pokemonNameList) {
          Response pokemonDetailResponse = await pokemonRepo.getPokemonDetails(pokemon);
          Map<String, dynamic> pokemonData = pokemonDetailResponse.body;

          pokemonList.add(PokemonModel.fromMap(pokemonData));
        }
        await pokemonRepo.addToPokemonLocalStorage(pokemonList);

        return true;
      } else {
        _status = 'Please check your internet connection and try again.';
        update();
        return false;
      }
    }
  }

  void clearLocalStorage() {
    for (String name in _pokemonNameList) {
      ImageService().deleteImageFromGallery(name);
    }
    pokemonRepo.clearPokemonLocalStorage();
  }
}
