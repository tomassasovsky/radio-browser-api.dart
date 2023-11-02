// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Language _$LanguageFromJson(Map<String, dynamic> json) => Language(
      name: json['name'] as String? ?? '',
      iso639: json['iso_639'] as String? ?? '',
      stationCount: json['stationcount'] as int? ?? 0,
    );

Map<String, dynamic> _$LanguageToJson(Language instance) => <String, dynamic>{
      'name': instance.name,
      'iso_639': instance.iso639,
      'stationcount': instance.stationCount,
    };
