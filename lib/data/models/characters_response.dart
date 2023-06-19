import 'package:yolo_casino_task/data/models/pagination_info_model.dart';

import 'character_model.dart';
import 'package:json_annotation/json_annotation.dart';


part 'characters_response.g.dart';


@JsonSerializable()
class CharactersResponse {
  PaginationInfoModel? info;
  List<CharacterModel>? results;

  CharactersResponse({this.info, this.results});

  factory CharactersResponse.fromJson(Map<String, dynamic> json) => _$CharactersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersResponseToJson(this);



}



