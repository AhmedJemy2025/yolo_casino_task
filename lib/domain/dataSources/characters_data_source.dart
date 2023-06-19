import '../../data/models/characters_response.dart';

abstract class CharactersDataSource {
  Future<CharactersResponse> fetchCharactersList(int page);
}
