// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StationCheck _$StationCheckFromJson(Map<String, dynamic> json) => StationCheck(
      checkUUID: json['checkuuid'] as String,
      stationUUID: json['stationuuid'] as String,
      source: json['source'] as String,
      codec: json['codec'] as String,
      bitrate: json['bitrate'] as int,
      hls: boolFromInt(json['hls'] as int?),
      ok: boolFromInt(json['ok'] as int?),
      timestamp: DateTime.parse(json['timestamp'] as String),
      urlCache: json['urlcache'] as String,
      metainfoOverridesDatabase:
          boolFromInt(json['metainfo_overrides_database'] as int?),
      public: boolFromInt(json['public'] as int?),
      name: json['name'] as String?,
      description: json['description'] as String?,
      tags: json['tags'] as String?,
      countryCode: json['countrycode'] as String?,
      countrysubdivisioncode: json['countrysubdivisioncode'] as String?,
      homepage: json['homepage'] as String?,
      loadbalancer: json['loadbalancer'] as String?,
      serverSoftware: json['server_software'] as String?,
      sampling: json['sampling'] as int?,
      timingMilliseconds: json['timing_ms'] as int,
      languageCodes: json['languagecodes'] as String?,
      sslError: boolFromInt(json['ssl_error'] as int?),
      geoLat: (json['geo_lat'] as num?)?.toDouble(),
      geoLong: (json['geo_long'] as num?)?.toDouble(),
      favicon: stringToNull(json['favicon'] as String?),
    );

Map<String, dynamic> _$StationCheckToJson(StationCheck instance) =>
    <String, dynamic>{
      'checkuuid': instance.checkUUID,
      'stationuuid': instance.stationUUID,
      'source': instance.source,
      'codec': instance.codec,
      'bitrate': instance.bitrate,
      'hls': intFromBool(instance.hls),
      'ok': intFromBool(instance.ok),
      'timestamp': instance.timestamp.toIso8601String(),
      'urlcache': instance.urlCache,
      'metainfo_overrides_database':
          intFromBool(instance.metainfoOverridesDatabase),
      'public': intFromBool(instance.public),
      'name': instance.name,
      'description': instance.description,
      'tags': instance.tags,
      'countrycode': instance.countryCode,
      'countrysubdivisioncode': instance.countrysubdivisioncode,
      'homepage': instance.homepage,
      'favicon': stringToJson(instance.favicon),
      'loadbalancer': instance.loadbalancer,
      'server_software': instance.serverSoftware,
      'sampling': instance.sampling,
      'timing_ms': instance.timingMilliseconds,
      'languagecodes': instance.languageCodes,
      'ssl_error': intFromBool(instance.sslError),
      'geo_lat': instance.geoLat,
      'geo_long': instance.geoLong,
    };
