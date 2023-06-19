import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:yolo_casino_task/core/models/failure.dart';
import 'package:yolo_casino_task/domain/entities/CharacterEntity.dart';
import 'package:yolo_casino_task/domain/useCases/fetch_characters_usecase.dart';

import '../test_helpers/init_mocks.mocks.dart';

void main() {
  late MockCharactersRepositoryImpl repository;
  late FetchCharactersUseCase useCase;

  setUp(() {
    repository = MockCharactersRepositoryImpl();
    useCase = FetchCharactersUseCase(repository);
  });

  int page = 1;

  late final List<CharacterEntity> characters = <CharacterEntity>[
    const CharacterEntity("Rick", "imageTest", "Alive", "Male", "Earth", "NY"),
    const CharacterEntity("Morty", "imageTest", "Alive", "Male", "Earth", "NY"),
    const CharacterEntity(
        "Super Rick", "imageTest", "Alive", "Male", "Earth", "NY"),
    const CharacterEntity(
        "Super Morty", "imageTest", "Alive", "Male", "Earth", "NY"),
  ];


  test('Should  return right response in success case', () async {
    when(repository.fetchCharactersList(page))
        .thenAnswer((_) async => right(characters));

    final result = await useCase.fetchCharactersList(page);

    result.fold((left) => fail("test failed"), (right) {
      expect(right, characters);
    });
  });

  test('Should  return left Failure Message response in failed', () async {
    when(repository.fetchCharactersList(page))
        .thenAnswer((_) async => const Left(Failure("ServerError")));

    final result = await useCase.fetchCharactersList(page);
    result.fold((left) {
      expect(left, const Failure("ServerError"));
    }, (right) => fail("test failed"));
  });
}
