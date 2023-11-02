// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryState _$CountryStateFromJson(Map<String, dynamic> json) => CountryState(
      country: json['country'] as String,
      name: json['name'] as String,
      stationCount: json['stationcount'] as int,
    );

Map<String, dynamic> _$CountryStateToJson(CountryState instance) =>
    <String, dynamic>{
      'name': instance.name,
      'stationcount': instance.stationCount,
      'country': instance.country,
    };
