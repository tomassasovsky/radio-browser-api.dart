import 'package:json_annotation/json_annotation.dart';
import 'package:radio_browser_api/src/_util/type_convertors.dart';

part 'station_check.g.dart';

/// {@template station_check_struct}
/// This struct is used in a represent an online check of a stream.
/// Most of the information got extracted by checking the http headers
/// of the stream.
/// {@endtemplate}
@JsonSerializable()
class StationCheck {
  /// {@macro station_check_struct}
  const StationCheck({
    required this.checkUUID,
    required this.stationUUID,
    required this.source,
    required this.codec,
    required this.bitrate,
    required this.hls,
    required this.ok,
    required this.timestamp,
    required this.urlCache,
    required this.metainfoOverridesDatabase,
    required this.timingMilliseconds,
    required this.sslError,
    this.public,
    this.name,
    this.description,
    this.tags,
    this.countryCode,
    this.countrysubdivisioncode,
    this.homepage,
    this.loadbalancer,
    this.serverSoftware,
    this.sampling,
    this.languageCodes,
    this.geoLat,
    this.geoLong,
    this.favicon,
  });

  /// {@macro station_check_struct}
  factory StationCheck.fromJson(Map<String, dynamic> json) =>
      _$StationCheckFromJson(json);

  /// An unique id for this StationCheck
  @JsonKey(name: 'checkuuid')
  final String checkUUID;

  /// An unique id for referencing a Station
  @JsonKey(name: 'stationuuid')
  final String stationUUID;

  /// DNS Name of the server that did the stream check.
  final String source;

  /// High level name of the used codec of the stream.
  /// May have the format AUDIO or AUDIO/VIDEO.
  final String codec;

  /// Bitrate 1000 bits per second (kBit/s) of the stream. (Audio + Video)
  final int bitrate;

  /// Mark if this stream is using HLS distribution or non-HLS.
  @JsonKey(fromJson: boolFromInt, toJson: intFromBool)
  final bool hls;

  /// Mark if this stream is reachable.
  @JsonKey(fromJson: boolFromInt, toJson: intFromBool)
  final bool ok;

  /// Date and time of check creation.
  @JsonKey(fromJson: DateTime.parse)
  final DateTime timestamp;

  /// Direct stream url that has been resolved from the main stream url.
  /// HTTP redirects and playlists have been decoded.
  /// If hls is true, then this is still a HLS-playlist.
  @JsonKey(name: 'urlcache')
  final String urlCache;

  /// Whether this stream has provided extended information and it should be
  /// used to override the local database.
  @JsonKey(
    name: 'metainfo_overrides_database',
    fromJson: boolFromInt,
    toJson: intFromBool,
  )
  final bool metainfoOverridesDatabase;

  /// 1 that this stream appears in the public
  /// shoutcast/icecast directory, otherwise 0.
  @JsonKey(fromJson: boolFromInt, toJson: intFromBool)
  final bool? public;

  /// The name extracted from the stream header.
  final String? name;

  /// The description extracted from the stream header.
  final String? description;

  /// Comma separated list of tags. (genres of this stream)
  final String? tags;

  /// Official countrycodes as in ISO 3166-1 alpha-2.
  @JsonKey(name: 'countrycode')
  final String? countryCode;

  /// Official country subdivision codes as in ISO 3166-2.
  @JsonKey(name: 'countrysubdivisioncode')
  final String? countrysubdivisioncode;

  /// The homepage extracted from the stream header.
  final String? homepage;

  /// The favicon extracted from the stream header.
  @JsonKey(fromJson: stringToNull, toJson: stringToJson)
  final String? favicon;

  /// The loadbalancer extracted from the stream header.
  final String? loadbalancer;

  /// The name of the server software used.
  @JsonKey(name: 'server_software')
  final String? serverSoftware;

  /// Audio sampling frequency in Hz
  final int? sampling;

  /// Timespan in miliseconds this check needed to be finished.
  @JsonKey(name: 'timing_ms')
  final int timingMilliseconds;

  /// The description extracted from the stream header.
  @JsonKey(name: 'languagecodes')
  final String? languageCodes;

  /// Whether an ssl error occured while connecting to the stream.
  @JsonKey(
    name: 'ssl_error',
    fromJson: boolFromInt,
    toJson: intFromBool,
  )
  final bool sslError;

  /// The geo location of the stream.
  @JsonKey(name: 'geo_lat')
  final double? geoLat;

  /// The geo location of the stream.
  @JsonKey(name: 'geo_long')
  final double? geoLong;

  /// Convert a [StationCheck] instance to a JSON object.
  Map<String, dynamic> toJson() => _$StationCheckToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
