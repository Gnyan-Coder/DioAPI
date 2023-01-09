import 'package:json_annotation/json_annotation.dart';

import 'model.dart';
part 'listusermodel.g.dart';

@JsonSerializable()
class ListUser{
  @JsonKey(name:"page")
  late int page;
  @JsonKey(name:"per_page")
  late int perPage;
  @JsonKey(name:"total")
  late int total;
  @JsonKey(name:"total_pages")
  late int totalPage;
  @JsonKey(name:"data")
  late List<User> users;
  ListUser();
  factory ListUser.fromJson(Map<String, dynamic> json) => _$ListUserFromJson(json);
  Map<String, dynamic> toJson() => _$ListUserToJson(this);
}