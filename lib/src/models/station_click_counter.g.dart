// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_click_counter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StationClickCounter _$StationClickCounterFromJson(Map<String, dynamic> json) =>
    StationClickCounter(
      ok: json['ok'] as bool,
      message: json['message'] as String,
      stationUUID: json['stationuuid'] as int,
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$StationClickCounterToJson(
        StationClickCounter instance) =>
    <String, dynamic>{
      'ok': instance.ok,
      'stationuuid': instance.stationUUID,
      'name': instance.name,
      'url': instance.url,
      'message': instance.message,
    };
