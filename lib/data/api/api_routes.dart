class APIRoutes {
  static String getPokemonURL(String name) => baseURL + pokemonURI + name;
  static String getPokemonListURL() => baseURL + pokemonListURI;
  static String getPokemonDescriptionURL() => baseURL + pokemonListURI;

  static const String baseURL = "https://pokeapi.co/api/v2";

  //Endpoints
  static const String pokemonURI = "/pokemon/";
  static const String pokemonListURI = "/pokemon?limit=10"; //retrieving up to 10
  static const String pokemonDescriptionURI = "pokemon-species"; //retrieving up to 10
}
