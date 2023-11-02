import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

/// {@template languages_struct}
/// Languages in the database. Countries are divided into Languages.
/// {@endtemplate}
@JsonSerializable()
class Language {
  /// {@macro languages_struct}
  const Language({
    required this.name,
    required this.iso639,
    required this.stationCount,
  });

  /// {@macro languages_struct}
  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  /// The name of this language.
  final String name;

  /// The language code in ISO 639-1 format (2 letters).
  @JsonKey(name: 'iso_639')
  final String iso639;

  /// The amount of stations in this language.
  @JsonKey(name: 'stationcount')
  final int stationCount;

  /// Convert a [Language] instance to a JSON object.
  Map<String, dynamic> toJson() => _$LanguageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
