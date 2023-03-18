import 'package:json_annotation/json_annotation.dart';

part 'station_click_counter.g.dart';

/// {@template station_click_counter}
/// The response from the API when clicking a station.
/// {@endtemplate}
@JsonSerializable()
class StationClickCounter {
  /// {@macro station_click_counter}
  const StationClickCounter({
    required this.ok,
    required this.message,
    required this.stationUUID,
    required this.name,
    required this.url,
  });

  /// {@macro station_click_counter}
  factory StationClickCounter.fromJson(Map<String, dynamic> json) =>
      _$StationClickCounterFromJson(json);

  /// Whether the request was successful.
  final bool ok;

  /// The UUID of the station in the database.
  @JsonKey(name: 'stationuuid')
  final int stationUUID;

  /// The name of the station.
  final String name;

  /// The URL of the station.
  final String url;

  /// The message.
  final String message;

  /// Convert a [StationClickCounter] instance to a JSON object.
  Map<String, dynamic> toJson() => _$StationClickCounterToJson(this);
}
