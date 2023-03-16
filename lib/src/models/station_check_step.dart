import 'package:json_annotation/json_annotation.dart';

part 'station_check_step.g.dart';

/// {@template station_check_step_struct}
/// This struct is used in a tree structure to represent all codepaths that
/// were necessary to check an address of a single stream.
/// Steps can cause multiple other steps for example playlists.
/// {@endtemplate}
@JsonSerializable()
class StationCheckStep {
  /// {@macro station_check_step_struct}
  const StationCheckStep({
    required this.stepUUID,
    required this.checkUUID,
    required this.stationUUID,
    required this.creationTimestamp,
    required this.url,
    this.parentStepUUID,
    this.urlType,
    this.error,
  });

  /// {@macro station_check_step_struct}
  factory StationCheckStep.fromJson(Map<String, dynamic> json) =>
      _$StationCheckStepFromJson(json);

  /// An unique id for this StationCheckStep
  @JsonKey(name: 'stepuuid')
  final String stepUUID;

  /// An unique id for referencing another StationCheckStep.
  /// Is set if this step has a parent.
  @JsonKey(name: 'parent_stepuuid')
  final String? parentStepUUID;

  /// An unique id for referencing a StationCheck.
  @JsonKey(name: 'checkuuid')
  final String checkUUID;

  /// An unique id for referencing a Station.
  @JsonKey(name: 'stationuuid')
  final String stationUUID;

  /// The url that this step of the checking process handled.
  final String url;

  /// Does represent which kind of url it is. One of the following:
  /// STREAM, REDIRECT, PLAYLIST.
  @JsonKey(name: 'urltype')
  final String? urlType;

  /// URL to the homepage of the stream, so you can direct the user to a
  /// page with more information about the stream.
  final String? error;

  /// Date and time of step creation.
  @JsonKey(name: 'creation_iso8601', fromJson: DateTime.parse)
  final DateTime creationTimestamp;

  /// Convert a [StationCheckStep] instance to a JSON object.
  Map<String, dynamic> toJson() => _$StationCheckStepToJson(this);
}
