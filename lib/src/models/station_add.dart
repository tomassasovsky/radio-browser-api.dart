import 'package:json_annotation/json_annotation.dart';

part 'station_add.g.dart';

/// {@template station_add}
/// The response from the API when adding a station.
/// {@endtemplate}
@JsonSerializable()
class StationAdd {
  /// {@macro station_add}
  const StationAdd({
    required this.ok,
    required this.message,
    required this.uuid,
  });

  /// {@macro station_add}
  factory StationAdd.fromJson(Map<String, dynamic> json) =>
      _$StationAddFromJson(json);

  /// Whether the request was successful.
  final bool ok;

  /// The message.
  final String message;

  /// The UUID of the station.
  final String uuid;

  /// Convert a [StationAdd] instance to a JSON object.
  Map<String, dynamic> toJson() => _$StationAddToJson(this);
}
