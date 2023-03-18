// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_add.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StationAdd _$StationAddFromJson(Map<String, dynamic> json) => StationAdd(
      ok: json['ok'] as bool,
      message: json['message'] as String,
      uuid: json['uuid'] as String,
    );

Map<String, dynamic> _$StationAddToJson(StationAdd instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'message': instance.message,
      'uuid': instance.uuid,
    };
