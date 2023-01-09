// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singleuserresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleUser _$SingleUserFromJson(Map<String, dynamic> json) =>
    SingleUser()..user = User.fromJson(json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$SingleUserToJson(SingleUser instance) =>
    <String, dynamic>{
      'data': instance.user,
    };
