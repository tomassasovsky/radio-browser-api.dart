// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

State _$StateFromJson(Map<String, dynamic> json) => State(
      country: json['country'] as String,
      name: json['name'] as String,
      stationCount: json['stationcount'] as int,
    );

Map<String, dynamic> _$StateToJson(State instance) => <String, dynamic>{
      'name': instance.name,
      'stationcount': instance.stationCount,
      'country': instance.country,
    };
