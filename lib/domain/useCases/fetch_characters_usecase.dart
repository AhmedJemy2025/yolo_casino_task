import 'package:dartz/dartz.dart';
import 'package:yolo_casino_task/domain/entities/CharacterEntity.dart';
import 'package:yolo_casino_task/domain/repositories/i_characters_repository.dart';

import '../../core/models/failure.dart';

class FetchCharactersUseCase {
  final ICharactersRepository repository;

  FetchCharactersUseCase(this.repository);

  Future<Either< Failure,List<CharacterEntity>>> fetchCharactersList(int page) {
    return repository.fetchCharactersList(page);
  }


}
