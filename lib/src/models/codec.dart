import 'package:json_annotation/json_annotation.dart';

part 'codec.g.dart';

/// {@template codec_struct}
/// Codecs in the database.
/// {@endtemplate}
@JsonSerializable()
class AudioCodec {
  /// {@macro codec_struct}
  const AudioCodec({
    required this.name,
    required this.stationCount,
  });

  /// {@macro codec_struct}
  factory AudioCodec.fromJson(Map<String, dynamic> json) =>
      _$AudioCodecFromJson(json);

  /// The name of the Codec.
  final String name;

  /// The amount of stations in this Codec.
  @JsonKey(name: 'stationcount')
  final int stationCount;

  /// Convert a [AudioCodec] instance to a JSON object.
  Map<String, dynamic> toJson() => _$AudioCodecToJson(this);
}
