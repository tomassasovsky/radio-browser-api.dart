import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';

/// {@template codec_struct}
/// Tags in the database.
/// {@endtemplate}
@JsonSerializable()
class Tag {
  /// {@macro codec_struct}
  const Tag({
    required this.name,
    required this.stationCount,
  });

  /// {@macro codec_struct}
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  /// The name of the Tag.
  final String name;

  /// The amount of stations in this Tag.
  @JsonKey(name: 'stationcount')
  final int stationCount;

  /// Convert a [Tag] instance to a JSON object.
  Map<String, dynamic> toJson() => _$TagToJson(this);
}
