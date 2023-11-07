import 'package:get/get.dart';
import 'package:poke_man/screens/home_screen.dart';
import 'package:poke_man/screens/pokemon_screen.dart';
import 'package:poke_man/screens/splash_screen.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initialPage = "/";
  static const String pokemonPage = "/pokemon-page";

  static String getSplashScreen() => splashPage;
  static String getInitialScreen(int index) => initialPage;
  static String getPokemonScreen(int pageId, String page) => '$pokemonPage?pageId=$pageId';

  static List<GetPage> routes = [
    GetPage(
        name: splashPage,
        page: () {
          return const SplashScreen();
        }),
    GetPage(
      name: initialPage,
      page: () {
        return HomeScreen();
      },
    ),
    GetPage(
        name: pokemonPage,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PokemonScreen(
            pageId: int.parse(pageId!),
          );
        },
        transition: Transition.fadeIn),
  ];
}
