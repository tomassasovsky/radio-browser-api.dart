// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['name'] as String,
      iso31661: json['iso_3166_1'] as String,
      stationCount: json['stationcount'] as int,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'iso_3166_1': instance.iso31661,
      'stationcount': instance.stationCount,
    };
