# Pokemon App

## Project Description
This Flutter application allows users to retrieve a list of Pokemon characters, view detailed information about each Pokemon, and store the data in a local database for offline access. The app uses the [PokeAPI](https://pokeapi.co/) to fetch Pokemon data.

## Contents
- [Installation](#installation)
- [Features](#features)
- [Local Database](#local-database)
- [API Integration](#api-integration)
- [Screenshots](#screenshots)

## Installation

1. Clone the repository to your local machine:
```bash
git clone https://github.com/afluxmhd/poke-mon.git
```

2. Navigate to the project directory:
```bash
cd poke-mon
```

4. Install the required dependencies:
```bash
flutter pub get
```

5. Open the project in your preferred Flutter IDE or editor.
6. Run the app on your connected device or emulator:
```bash
flutter run
```

## Features

### List of 10 Pokemon on Home Screen
- Displays an initial list of up to 10 Pokemon characters on the home screen.

### Detailed Pokemon Information
- Provides comprehensive details for each Pokemon, including name, abilities, height, weight, and base experience, accessible by tapping on a Pokemon.

### Offline Access
- Enables users to access stored Pokemon data without an internet connection, ensuring constant usability.

## Local Database

### What data is stored locally:
- The local database in the Pokemon Explorer App stores the following data for each Pokemon character:
- Pokemon Image
- Name
- Abilities
- Height
- Weight
- Base Experience

### How users can access Pokemon data without an internet connection:
- When the app is launched with an internet connection, it fetches data and images from the PokeAPI server and stores this information in the local storage on the user's device. Specifically, it saves:
- Pokemon images to be displayed.
- Other relevant data (name, abilities, height, weight, base experience) in a structured format within the local database.
- On subsequent launches, even without an active internet connection, the app seamlessly falls back to using the locally stored data for each Pokemon. Users can view the details for Pokemon characters without needing an internet connection.
This offline capability ensures that users of your Pokemon Explorer App can access essential Pokemon details and images even when they are not connected to the internet, making the app more versatile and user-friendly.

## API Integration

### Integration with the PokeAPI

#### Overview
The Pokemon Explorer App integrates with the [PokeAPI](https://pokeapi.co/) to retrieve data about Pokemon characters. The app communicates with the API by making HTTP requests to specific endpoints. Here is an overview of how API requests are made:

#### API Endpoints
The following API endpoints are used to fetch Pokemon data:

- Base URL: The base URL for all API requests is set to "https://pokeapi.co/api/v2".

- Pokemon List Endpoint: The app uses the "pokemonListURI" endpoint to retrieve a list of up to 10 Pokemon characters. It appends "?limit=10" to the endpoint to specify the limit of results.                              
  Endpoint: https://pokeapi.co/api/v2/pokemon?limit=10

- Pokemon Details Endpoint: To fetch detailed information about a specific Pokemon, the app uses the "pokemonURI" endpoint. It appends the Pokemon's name or ID to this endpoint to get data for that specific Pokemon.                          
  Example: https://pokeapi.co/api/v2/pokemon/charizard

- Pokemon Description Endpoint: For additional information about a Pokemon, such as its Pokedex entries and descriptions, the app uses the "pokemonDescriptionURI" endpoint. The Pokemon's species name or ID is appended to this endpoint to retrieve the relevant data.
  Example: https://pokeapi.co/api/v2/pokemon-species/charizard

## Screenshots

<p align="center">
  <img src="https://github.com/afluxmhd/poke-mon/assets/93920274/a9efca4a-727f-4670-a4d1-bdfa1217863c" width="24%" />
  <img src="https://github.com/afluxmhd/poke-mon/assets/93920274/aaf23e52-2d0a-44a5-b8d6-3f5e9e2265e2" width="24%" />
  <img src="https://github.com/afluxmhd/poke-mon/assets/93920274/35d9a94a-ac57-47fb-b391-43ea88b357e6" width="24%" />
 <img src="https://github.com/afluxmhd/poke-mon/assets/93920274/a008381d-2339-40c6-9155-a7e998cadad1" width="24%" />
</p>






