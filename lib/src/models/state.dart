import 'package:json_annotation/json_annotation.dart';

part 'state.g.dart';

/// {@template states_struct}
/// States in the database. Countries are divided into state.
/// {@endtemplate}
@JsonSerializable()
class State {
  /// {@macro states_struct}
  const State({
    required this.country,
    required this.name,
    required this.stationCount,
  });

  /// {@macro states_struct}
  factory State.fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  /// The name of the state.
  final String name;

  /// The amount of stations in this State.
  @JsonKey(name: 'stationcount')
  final int stationCount;

  /// The name of the country.
  final String country;

  /// Convert a [State] instance to a JSON object.
  Map<String, dynamic> toJson() => _$StateToJson(this);
}
