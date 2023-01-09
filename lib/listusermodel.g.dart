// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listusermodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListUser _$ListUserFromJson(Map<String, dynamic> json) => ListUser()
  ..page = json['page'] as int
  ..perPage = json['per_page'] as int
  ..total = json['total'] as int
  ..totalPage = json['total_pages'] as int
  ..users = (json['data'] as List<dynamic>)
      .map((e) => User.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$ListUserToJson(ListUser instance) => <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPage,
      'data': instance.users,
    };
