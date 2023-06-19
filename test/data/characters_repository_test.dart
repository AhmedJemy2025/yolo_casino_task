import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';
import 'package:yolo_casino_task/core/mapper/mapper.dart';
import 'package:yolo_casino_task/core/models/failure.dart';
import 'package:yolo_casino_task/data/models/character_model.dart';
import 'package:yolo_casino_task/data/models/characters_response.dart';
import 'package:yolo_casino_task/data/models/origin_model.dart';
import 'package:yolo_casino_task/data/models/pagination_info_model.dart';
import 'package:yolo_casino_task/data/repository/characters_repository_impl.dart';
import 'package:yolo_casino_task/domain/entities/CharacterEntity.dart';
import 'package:yolo_casino_task/domain/mapper/characters_mapper.dart';

import '../test_helpers/init_mocks.mocks.dart';

void main() {
  late MockCharactersRemoteDataSource dataSource;
  late CharactersRepositoryImpl repository;

  setUp(() {
    dataSource = MockCharactersRemoteDataSource();
    GetIt.instance
        .registerLazySingleton<Mapper<CharacterModel, CharacterEntity>>(
            () => CharactersMapper());
    repository = CharactersRepositoryImpl(dataSource);


  });

  int page = 1;

   final CharactersResponse charactersResponse = CharactersResponse(
      info:
          PaginationInfoModel(count: 42, next: "next", pages: 42, prev: null),
      results: <CharacterModel>[
        CharacterModel(
            id: 1,
            name: "rick",
            status: "Alive",
            type: 'Human',
            gender: "Male",
            image: "image",
            created: "",
            episode: ["aaaa"],
            location: Origin(name: "location", url: "url") ,
            origin:Origin(name: "origin", url: "url")  , url: "url" , species: "spices")
      ]);

  final characters = <CharacterEntity>[const CharacterEntity("rick", "image", "Alive", "Male", "origin", "location")];

  test('Should  return right response in success case', () async {
    when(dataSource.fetchCharactersList(page))
        .thenAnswer((_) async => Future.value(charactersResponse));

    final result = await repository.fetchCharactersList(page);
    
    result.fold((left) => fail("test failed"), (right) {
      expect(right, characters);
    });

  });

  test('Should  return left Failure Message response in failed', () async {
    when(dataSource.fetchCharactersList(page))
        .thenAnswer((_) async => throw Exception("Server Error"));

    final result = await repository.fetchCharactersList(page);

    result.fold((left) {
      expect(left, const Failure("Server Error"));
      
    }, (right) =>fail('test failed'));

  });
}
