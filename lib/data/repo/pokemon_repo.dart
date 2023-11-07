import 'package:poke_man/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  PokemonRepo({required this.apiClient, required this.sharedPreferences});
}
