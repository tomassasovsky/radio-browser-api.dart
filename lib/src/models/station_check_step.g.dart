// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_check_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StationCheckStep _$StationCheckStepFromJson(Map<String, dynamic> json) =>
    StationCheckStep(
      stepUUID: json['stepuuid'] as String,
      checkUUID: json['checkuuid'] as String,
      stationUUID: json['stationuuid'] as String,
      creationTimestamp: DateTime.parse(json['creation_iso8601'] as String),
      url: json['url'] as String,
      parentStepUUID: json['parent_stepuuid'] as String?,
      urlType: json['urltype'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$StationCheckStepToJson(StationCheckStep instance) =>
    <String, dynamic>{
      'stepuuid': instance.stepUUID,
      'parent_stepuuid': instance.parentStepUUID,
      'checkuuid': instance.checkUUID,
      'stationuuid': instance.stationUUID,
      'url': instance.url,
      'urltype': instance.urlType,
      'error': instance.error,
      'creation_iso8601': instance.creationTimestamp.toIso8601String(),
    };
