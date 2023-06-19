import 'package:dartz/dartz.dart';
import 'package:yolo_casino_task/domain/entities/CharacterEntity.dart';

import '../../core/models/failure.dart';

abstract class ICharactersRepository {
  Future<Either< Failure,List<CharacterEntity>>> fetchCharactersList(int page);
}
