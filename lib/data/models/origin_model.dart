import 'package:json_annotation/json_annotation.dart';

part 'origin_model.g.dart';


@JsonSerializable()
class Origin {
  String? name;
  String? url;
  Origin({this.name, this.url});


  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);

  Map<String, dynamic> toJson() => _$OriginToJson(this);

}
