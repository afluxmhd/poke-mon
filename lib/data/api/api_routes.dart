class APIRoutes {
  static String getPokemonURL() => baseURL + pokemonURI;

  static const String baseURL = "https://pokeapi.co/api/v2";

  //Endpoints
  static const String pokemonURI = "/pokemon";
}
