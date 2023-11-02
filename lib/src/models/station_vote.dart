import 'package:json_annotation/json_annotation.dart';

part 'station_vote.g.dart';

/// {@template station_vote}
/// The response from the API when voting for a station.
/// {@endtemplate}
@JsonSerializable()
class StationVote {
  /// {@macro station_vote}
  const StationVote({
    required this.ok,
    required this.message,
  });

  /// {@macro station_vote}
  factory StationVote.fromJson(Map<String, dynamic> json) =>
      _$StationVoteFromJson(json);

  /// Whether the request was successful.
  final bool ok;

  /// The message.
  final String message;

  /// Convert a [StationVote] instance to a JSON object.
  Map<String, dynamic> toJson() => _$StationVoteToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
