import 'dart:convert';

import 'package:http/http.dart';
import 'package:yolo_casino_task/data/models/characters_response.dart';
import 'package:yolo_casino_task/domain/dataSources/characters_data_source.dart';

class CharactersRemoteDataSource extends CharactersDataSource {
  final Client client;

  CharactersRemoteDataSource(this.client);

  @override
  Future<CharactersResponse> fetchCharactersList(int page) async {
    final response = await client.get(
        Uri.parse("https://rickandmortyapi.com/api/character/?page=$page"));
    if (response.statusCode == 200) {
      return CharactersResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("server exception");
    }
  }
}
