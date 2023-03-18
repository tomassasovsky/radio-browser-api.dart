// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_click.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StationClick _$StationClickFromJson(Map<String, dynamic> json) => StationClick(
      stationUUID: json['stationuuid'] as int,
      clickUUID: json['clickuuid'] as int,
      clickTimestamp: json['clicktimestamp'] as int,
    );

Map<String, dynamic> _$StationClickToJson(StationClick instance) =>
    <String, dynamic>{
      'stationuuid': instance.stationUUID,
      'clickuuid': instance.clickUUID,
      'clicktimestamp': instance.clickTimestamp,
    };
