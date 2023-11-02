import 'package:json_annotation/json_annotation.dart';

part 'country_state.g.dart';

/// {@template states_struct}
/// States in the database. Countries are divided into state.
/// {@endtemplate}
@JsonSerializable()
class CountryState {
  /// {@macro states_struct}
  const CountryState({
    required this.country,
    required this.name,
    required this.stationCount,
  });

  /// {@macro states_struct}
  factory CountryState.fromJson(Map<String, dynamic> json) =>
      _$CountryStateFromJson(json);

  /// The name of the state.
  final String name;

  /// The amount of stations in this State.
  @JsonKey(name: 'stationcount')
  final int stationCount;

  /// The name of the country.
  final String country;

  /// Convert a [CountryState] instance to a JSON object.
  Map<String, dynamic> toJson() => _$CountryStateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
