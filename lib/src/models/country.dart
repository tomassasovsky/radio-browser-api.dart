import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

/// {@template country_struct}
/// This struct is used in a tree structure to represent all codepaths that
/// were necessary to check an address of a single stream.
/// Steps can cause multiple other steps for example playlists.
/// {@endtemplate}
@JsonSerializable()
class Country {
  /// {@macro country_struct}
  const Country({
    required this.name,
    required this.iso31661,
    required this.stationCount,
  });

  /// {@macro country_struct}
  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  /// The name of the country.
  final String name;

  /// The country code in ISO 3166-1 alpha-2 format.
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;

  /// The amount of stations in this country.
  @JsonKey(name: 'stationcount')
  final int stationCount;

  /// Convert a [Country] instance to a JSON object.
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
