import 'package:get/get.dart';
import 'package:poke_man/data/repo/pokemon_repo.dart';
import 'package:poke_man/models/pokemon_model.dart';

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

  Future<bool> getPokemonList() async {
    _isloading = true;

    bool isLocalStorageDataAvailable = pokemonRepo.checkPokemonLocalStorage();

    if (isLocalStorageDataAvailable) {
      _status = 'fetching from local Strorage';
      update();

      await Future.delayed(const Duration(seconds: 2));
      _pokemonList = await pokemonRepo.getPokemonListFromLocalStorage();
      return true;
    } else {
      _status = 'fetching from Pokemon Server...';
      update();
      Response pokemonNameResponse = await pokemonRepo.getPokemonList();

      if (pokemonNameResponse.body is Map<String, dynamic>) {
        Map<String, dynamic> pokemonNameData = pokemonNameResponse.body;
        pokemonNameData.forEach((key, value) {
          if (key == 'results') {
            var pokemonNameList = pokemonNameData['results'];
            if (pokemonNameList is List) {
              for (var item in pokemonNameList) {
                if (item is Map<String, dynamic> && item.containsKey('name')) {
                  var name = item['name'];
                  _pokemonNameList.add(name);
                }
              }
            }
          }
        });

        for (String pokemon in _pokemonNameList) {
          Response pokemonDetailResponse = await pokemonRepo.getPokemonDetails(pokemon);
          Map<String, dynamic> pokemonData = pokemonDetailResponse.body;

          pokemonList.add(PokemonModel.fromMap(pokemonData));
        }
        await pokemonRepo.addToPokemonLocalStorage(pokemonList);

        return true;
      } else {
        _status = 'Failed to fetch data from the Pokemon server.\nPlease check your internet connection and try again.';
        return false;
      }
    }
  }

  void clearLocalStorage() {
    pokemonRepo.clearPokemonLocalStorage();
  }
}
