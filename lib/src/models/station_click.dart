import 'package:json_annotation/json_annotation.dart';

part 'station_click.g.dart';

/// {@template station_click}
/// The response from the API when getting the list of a station's clicks.
/// {@endtemplate}
@JsonSerializable()
class StationClick {
  /// {@macro station_click}
  const StationClick({
    required this.stationUUID,
    required this.clickUUID,
    required this.clickTimestamp,
  });

  /// {@macro station_click}
  factory StationClick.fromJson(Map<String, dynamic> json) =>
      _$StationClickFromJson(json);

  /// The UUID of the station in the database.
  @JsonKey(name: 'stationuuid')
  final int stationUUID;

  /// The UUID of the click in the database.
  @JsonKey(name: 'clickuuid')
  final int clickUUID;

  /// The timestamp of the click.
  @JsonKey(name: 'clicktimestamp')
  final int clickTimestamp;

  /// Convert a [StationClick] instance to a JSON object.
  Map<String, dynamic> toJson() => _$StationClickToJson(this);
}
