import 'package:json_annotation/json_annotation.dart';
import 'model.dart';
part 'singleuserresponse.g.dart';
@JsonSerializable()
class SingleUser{
  SingleUser();
  @JsonKey(name:"data")
  late User user;
  factory SingleUser.fromJson(Map<String, dynamic> json) => _$SingleUserFromJson(json);
  Map<String, dynamic> toJson() => _$SingleUserToJson(this);
}