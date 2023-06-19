import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:yolo_casino_task/core/mapper/mapper.dart';
import 'package:yolo_casino_task/data/dataSources/characters_remote_data_source.dart';
import 'package:yolo_casino_task/data/models/character_model.dart';
import 'package:yolo_casino_task/domain/dataSources/characters_data_source.dart';
import 'package:yolo_casino_task/domain/entities/CharacterEntity.dart';
import 'package:yolo_casino_task/domain/mapper/characters_mapper.dart';
import 'package:yolo_casino_task/domain/repositories/i_characters_repository.dart';
import 'package:yolo_casino_task/domain/useCases/fetch_characters_usecase.dart';

import '../data/repository/characters_repository_impl.dart';
import '../presentation/bloc/characters_bloc.dart';

class CharactersDIModule {
  void configure(GetIt getIt) {
    final httpClient = Client();

    GetIt.instance.registerLazySingleton<CharactersDataSource>(
        () => CharactersRemoteDataSource(httpClient));
    GetIt.instance
        .registerLazySingleton<Mapper<CharacterModel, CharacterEntity>>(
            () => CharactersMapper());
    GetIt.instance.registerLazySingleton<ICharactersRepository>(() =>
        CharactersRepositoryImpl(GetIt.instance.get<CharactersDataSource>()));

    GetIt.instance.registerLazySingleton<FetchCharactersUseCase>(() =>
        FetchCharactersUseCase(GetIt.instance.get<ICharactersRepository>()));

    GetIt.instance.registerLazySingleton<CharactersBloc>(
        () => CharactersBloc(GetIt.instance.get<FetchCharactersUseCase>()));
  }
}
