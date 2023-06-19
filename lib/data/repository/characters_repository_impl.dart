import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:yolo_casino_task/core/mapper/mapper.dart';
import 'package:yolo_casino_task/data/models/character_model.dart';
import 'package:yolo_casino_task/domain/dataSources/characters_data_source.dart';
import 'package:yolo_casino_task/domain/entities/CharacterEntity.dart';
import 'package:yolo_casino_task/domain/repositories/i_characters_repository.dart';

import '../../core/models/failure.dart';

class CharactersRepositoryImpl extends ICharactersRepository{
  final CharactersDataSource dataSource;

  CharactersRepositoryImpl(this.dataSource);

  @override
  Future<Either< Failure,List<CharacterEntity>>>fetchCharactersList(int page) async {

    try{

      var mapper =  GetIt.instance.get<Mapper<CharacterModel , CharacterEntity>>();

      var response = await dataSource.fetchCharactersList(page);
      var charactersList = mapper.fromModelListToEntityList(response.results);

      return Right(charactersList);

    }
    catch(e){
      return const Left(Failure("Server Error"));
    }



  }



}
