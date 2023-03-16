// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'station.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Station _$StationFromJson(Map<String, dynamic> json) => Station(
      changeUUID: json['changeuuid'] as String,
      stationUUID: json['stationuuid'] as String,
      serverUUID: json['serveruuid'] as String?,
      name: json['name'] as String,
      url: json['url'] as String,
      urlResolved: stringToNull(json['url_resolved'] as String?),
      homepage: stringToNull(json['homepage'] as String?),
      favicon: stringToNull(json['favicon'] as String?),
      tags: stringToNull(json['tags'] as String?),
      country: json['country'] as String,
      countryCode: json['countrycode'] as String,
      state: stringToNull(json['state'] as String?),
      language: stringToNull(json['language'] as String?),
      languageCodes: stringToNull(json['languagecodes'] as String?),
      votes: json['votes'] as int,
      lastChangeTime: DateTime.parse(json['lastchangetime'] as String),
      codec: stringToNull(json['codec'] as String?),
      bitrate: json['bitrate'] as int,
      hls: boolFromInt(json['hls'] as int?),
      lastCheckOk: boolFromInt(json['lastcheckok'] as int?),
      lastCheckTime: DateTime.tryParse(json['lastchecktime'] as String),
      lastCheckOkTime: DateTime.tryParse(json['lastcheckoktime'] as String),
      lastLocalCheckTime:
          DateTime.tryParse(json['lastlocalchecktime'] as String),
      clickTimestamp: DateTime.tryParse(json['clicktimestamp'] as String),
      clickCount: json['clickcount'] as int,
      clickTrend: json['clicktrend'] as int,
      sslError: boolFromInt(json['ssl_error'] as int?),
      geoLat: (json['geo_lat'] as num?)?.toDouble(),
      geoLong: (json['geo_long'] as num?)?.toDouble(),
      hasExtendedInfo: json['has_extended_info'] as bool,
    );

Map<String, dynamic> _$StationToJson(Station instance) => <String, dynamic>{
      'changeuuid': instance.changeUUID,
      'stationuuid': instance.stationUUID,
      'serveruuid': instance.serverUUID,
      'name': instance.name,
      'url': instance.url,
      'url_resolved': instance.urlResolved,
      'homepage': instance.homepage,
      'favicon': instance.favicon,
      'tags': instance.tags,
      'country': instance.country,
      'countrycode': instance.countryCode,
      'state': instance.state,
      'language': instance.language,
      'languagecodes': instance.languageCodes,
      'votes': instance.votes,
      'lastchangetime': instance.lastChangeTime.toIso8601String(),
      'codec': instance.codec,
      'bitrate': instance.bitrate,
      'hls': intFromBool(instance.hls),
      'lastcheckok': intFromBool(instance.lastCheckOk),
      'lastchecktime': instance.lastCheckTime?.toIso8601String(),
      'lastcheckoktime': instance.lastCheckOkTime?.toIso8601String(),
      'lastlocalchecktime': instance.lastLocalCheckTime?.toIso8601String(),
      'clicktimestamp': instance.clickTimestamp?.toIso8601String(),
      'clickcount': instance.clickCount,
      'clicktrend': instance.clickTrend,
      'ssl_error': intFromBool(instance.sslError),
      'geo_lat': instance.geoLat,
      'geo_long': instance.geoLong,
      'has_extended_info': instance.hasExtendedInfo,
    };
