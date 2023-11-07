import 'package:get/get.dart';
import 'package:poke_man/controllers/pokemon_controller.dart';
import 'package:poke_man/data/api/api_routes.dart';
import 'package:poke_man/data/repo/pokemon_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/api/api_client.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: APIRoutes.baseURL));

  //repos
  Get.lazyPut(() => PokemonRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  //controllers
  Get.lazyPut(() => PokemonController(pokemonRepo: Get.find()));
}
