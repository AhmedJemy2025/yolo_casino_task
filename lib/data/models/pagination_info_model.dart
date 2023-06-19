import 'package:json_annotation/json_annotation.dart';

part 'pagination_info_model.g.dart';

@JsonSerializable()
class PaginationInfoModel {
  int? count;
  int? pages;
  String? next;
  String? prev;

  PaginationInfoModel({this.count, this.pages, this.next, this.prev});


  factory PaginationInfoModel.fromJson(Map<String, dynamic> json) => _$PaginationInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationInfoModelToJson(this);



}
