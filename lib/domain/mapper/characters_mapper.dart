import 'package:yolo_casino_task/core/mapper/mapper.dart';
import 'package:yolo_casino_task/data/models/character_model.dart';
import 'package:yolo_casino_task/domain/entities/CharacterEntity.dart';

class CharactersMapper extends Mapper<CharacterModel, CharacterEntity> {



  @override
  List<CharacterEntity> fromModelListToEntityList(
      List<CharacterModel>? modelList) {
    return modelList
        ?.map((model) =>
        CharacterEntity(
            model.name ?? "",
            model.image ?? "",
            model.status ?? "",
            model.gender ?? "",
            model.origin?.name ?? "",
            model.location?.name ?? ""))
        .toList() ??[];
  }

  @override
  CharacterEntity fromModelToEntity(CharacterModel model) {
    return CharacterEntity(
        model.name ?? "",
        model.image ?? "",
        model.status ?? "",
        model.gender ?? "",
        model.origin?.name ?? "",
        model.location?.name ?? "");
  }
}
