import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:radio_browser_api/src/models/codec.dart';
import 'package:radio_browser_api/src/models/country.dart';
import 'package:radio_browser_api/src/models/input_parameters.dart';
import 'package:radio_browser_api/src/models/language.dart';
import 'package:radio_browser_api/src/models/list_response.dart';
import 'package:radio_browser_api/src/models/state.dart';
import 'package:radio_browser_api/src/models/station.dart';
import 'package:radio_browser_api/src/models/station_add.dart';
import 'package:radio_browser_api/src/models/station_check.dart';
import 'package:radio_browser_api/src/models/station_check_step.dart';
import 'package:radio_browser_api/src/models/station_click.dart';
import 'package:radio_browser_api/src/models/station_click_counter.dart';
import 'package:radio_browser_api/src/models/station_vote.dart';
import 'package:radio_browser_api/src/models/tag.dart';

/// {@template radio_browser_api}
/// An HTTP client for Radio Browser
/// {@endtemplate}
class RadioBrowserApi {
  /// {@macro radio_browser_api}
  const RadioBrowserApi.fromHost(this.host);

  /// The host of the Radio Browser API.
  final String host;

  /// Returns a list of all countries in the database. If a filter is given,
  /// it will only return the ones containing the filter as substring.
  Future<RadioBrowserListResponse<Country>> getCountries({
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/countries',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Country.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// Returns a list of all codecs in the database. If a filter is given,
  /// it will only return the ones containing the filter as substring.
  Future<RadioBrowserListResponse<AudioCodec>> getCodecs({
    InputParameters? parameters,
    String? filter,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/codecs/${filter ?? ''}',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => AudioCodec.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// Returns a list of all states in the database. Countries are divided into
  /// states. If a filter is given, it will only return the ones containing the
  /// filter as substring. If a country is given,
  /// it will only display states in this country
  Future<RadioBrowserListResponse<State>> getStates({
    InputParameters? parameters,

    /// If a filter is given, it will only return the ones containing the
    /// filter as substring
    String? filter,

    /// Filter states by country name
    String? country,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path:
          '/json/states${country != null ? '/$country' : ''}${filter != null ? '/$filter' : ''}',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => State.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// Returns a list of all languages in the database. If a filter is given,
  /// it will only return the ones containing the filter as substring.
  Future<RadioBrowserListResponse<Language>> getLanguages({
    InputParameters? parameters,

    /// If a filter is given, it will only return the ones containing the
    /// filter as substring
    String? filter,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/languages/${filter ?? ''}',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Language.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// Returns a list of all tags in the database. If a filter is given,
  /// it will only return the ones containing the filter as substring.
  Future<RadioBrowserListResponse<Tag>> getTags({
    InputParameters? parameters,

    /// If a filter is given, it will only return the ones containing the
    /// filter as substring
    String? filter,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/tags/${filter ?? ''}',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Tag.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// Returns a list of all stations in the database that match with the
  /// provided UUID.
  Future<RadioBrowserListResponse<Station>> getStationsByUUID({
    /// List of UUIDs of the stations to search for.
    required List<String> uuids,
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/byuuid',
      queryParameters: {
        ...?parameters?.toMap(),
        'uuids': uuids.join(','),
      },
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// Returns a list of all stations in the database that match with the
  /// provided name.
  Future<RadioBrowserListResponse<Station>> getStationsByName({
    /// name of the station to search for
    required String name,
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/byname/$name',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// Returns a list of all stations in the database that match with the
  /// provided name, but only if the name is an exact match.
  Future<RadioBrowserListResponse<Station>> getStationsByNameExact({
    required String name,
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/bynameexact/$name',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// Returns a list of all stations in the database that match with the
  /// provided codec.
  Future<RadioBrowserListResponse<Station>> getStationsByCodec({
    /// codec of the station to search for
    required String codec,
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/bycodec/$codec',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// Returns a list of all stations in the database that match with the
  /// provided codec, but only if the codec is an exact match.
  Future<RadioBrowserListResponse<Station>> getStationsByCodecExact({
    /// codec of the station to search for
    required String codec,
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/bycodecexact/$codec',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// Returns a list of all stations in the database that match with the
  /// provided country.
  Future<RadioBrowserListResponse<Station>> getStationsByCountry({
    /// country of the station to search for
    required String country,
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/bycountry/$country',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// Returns a list of all stations in the database that match with the
  /// provided country, but only if the country is an exact match.
  Future<RadioBrowserListResponse<Station>> getStationsByCountryExact({
    /// country of the station to search for
    required String country,
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/bycountryexact/$country',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// Returns a list of all stations in the database that match with the
  /// provided state.
  Future<RadioBrowserListResponse<Station>> getStationsByState({
    /// state of the station to search for
    required String state,
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/bystate/$state',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// Returns a list of all stations in the database that match with the
  /// provided state, but only if the state is an exact match.
  Future<RadioBrowserListResponse<Station>> getStationsByStateExact({
    /// state of the station to search for
    required String state,
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/bystateexact/$state',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// Returns a list of all stations in the database that match with the
  /// provided language.
  Future<RadioBrowserListResponse<Station>> getStationsByLanguage({
    /// language of the station to search for
    required String language,
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/bylanguage/$language',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// Returns a list of all stations in the database that match with the
  /// provided language, but only if the language is an exact match.
  Future<RadioBrowserListResponse<Station>> getStationsByLanguageExact({
    /// language of the station to search for
    required String language,
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/bylanguageexact/$language',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// Returns a list of all stations in the database that match with the
  /// provided tag.
  Future<RadioBrowserListResponse<Station>> getStationsByTag({
    /// tag of the station to search for
    required String tag,
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/bytag/$tag',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// Returns a list of all stations in the database that match with the
  /// provided tag, but only if the tag is an exact match.
  Future<RadioBrowserListResponse<Station>> getStationsByTagExact({
    /// tag of the station to search for
    required String tag,
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/bytagexact/$tag',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// Returns a list of all stations in the database.
  Future<RadioBrowserListResponse<Station>> getAllStations({
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// A list of station check results. If a station UUID is provided, the whole
  /// history will be returned. If a station ID is not provided, a list of all
  /// last checks of all stations will be sent (without older check results).
  Future<RadioBrowserListResponse<StationCheck>> getStationCheckResults({
    String? stationUUID,
    String? lastCheckUUID,
    int? seconds,
    int? limit,
  }) async {
    assert(
      seconds == null || seconds >= 0,
      'Invalid seconds value; must be greater than or equal to 0',
    );
    assert(
      limit == null || limit >= 0,
      'Invalid limit value; must be greater than or equal to 0',
    );

    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/checks${stationUUID == null ? '' : '/stationuuid'}',
      queryParameters: {
        if (stationUUID != null) 'stationuuid': stationUUID,
        if (lastCheckUUID != null) 'lastcheckuuid': lastCheckUUID,
        if (seconds != null) 'seconds': seconds.toString(),
        if (limit != null) 'limit': limit.toString(),
      },
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => StationCheck.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      InputParameters(
        limit: limit,
      ),
    );
  }

  /// A list of station clicks. If a station UUID is provided, only clicks of
  /// the station will be returned. If a station UUID is not provided, a list
  /// of all clicks of all stations will be sent (chunksize 10000).
  Future<RadioBrowserListResponse<StationClick>> getStationClicks({
    /// If set, only list check result of the matching station.
    String? stationUUID,

    /// If set, only list clicks after the click with the given uuid.
    /// Use this to continue chunked retrieval to get the next 10000 clicks.
    String? lastClickUUID,

    /// if >0, it will only return history entries from the last 'seconds'.
    int? seconds,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/clicks${stationUUID == null ? '' : '/stationuuid'}',
      queryParameters: {
        if (stationUUID != null) 'stationuuid': stationUUID,
        if (lastClickUUID != null) 'lastclickuuid': lastClickUUID,
        if (seconds != null) 'seconds': seconds.toString(),
      },
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => StationClick.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
    );
  }

  /// A list of steps that needed to be done to finish a station check.
  Future<RadioBrowserListResponse<StationCheckStep>> getStationCheckSteps({
    /// List of UUIDs of stations
    required List<String> uuids,
  }) async {
    assert(
      uuids.isNotEmpty,
      'Invalid uuids value; must contain at least one UUID',
    );

    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/checksteps',
      queryParameters: {
        'uuids': uuids.join(','),
      },
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => StationCheckStep.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
    );
  }

  /// Increase the click count of a station by one. This should be called
  /// everytime when a user starts playing a stream to mark the stream more
  /// popular than others. Every call to this endpoint from the same IP address
  /// and for the same station only gets counted once per day. The call will
  /// return detailed information about the stream.
  Future<StationClickCounter> clickStation({
    /// The UUID of the station that was clicked.
    required String uuid,
  }) async {
    assert(
      uuid.isNotEmpty,
      'Invalid uuids value; must contain at least one UUID',
    );

    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/url/$uuid',
    );

    final response = await http.get(uri);
    return StationClickCounter.fromJson((response.body as Map).cast());
  }

  /// A list of radio stations that match the search. It will search for the
  /// station whose attribute contains the search term.
  /// Please use Count station click API call to let the click be counted.
  Future<RadioBrowserListResponse<Station>> advancedStationSearch({
    /// Name of the station.
    String? name,

    /// True: only exact matches, otherwise all matches.
    bool? nameExact,

    /// Country of the station.
    String? country,

    /// True: only exact matches, otherwise all matches.
    bool? countryExact,

    /// 2-digit countrycode of the station (see ISO 3166-1 alpha-2).
    /// https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
    String? countryCode,

    /// State of the station-
    String? state,

    /// True: only exact matches, otherwise all matches.
    bool? stateExact,

    /// Language of the station-
    String? language,

    /// True: only exact matches, otherwise all matches.
    bool? languageExact,

    /// Tag of the station.
    String? tag,

    /// True: only exact matches, otherwise all matches.
    bool? tagExact,

    /// A list of tags. All tags in list have to match.
    String? tagList,

    /// The codec of the station.
    String? codec,

    /// Minimum of kbps for bitrate field of stations in result.
    String? bitrateMin,

    /// Maximum of kbps for bitrate field of stations in result.
    String? bitrateMax,

    /// not set=display all, true=show only stations with geo_info,
    /// false=show only stations without geo_info.
    bool? hasGeoInfo,

    /// not set=display all, true=show only stations which do provide extended
    /// information, false=show only stations without extended information.
    bool? hasExtendedInfo,

    /// not set=display all, true=show only stations which have https url,
    /// false=show only stations that do stream unencrypted with http.
    bool? isHttps,

    /// Used for pagination.
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/search',
      queryParameters: {
        if (name != null) 'name': name,
        if (nameExact != null) 'name_exact': nameExact.toString(),
        if (country != null) 'country': country,
        if (countryExact != null) 'country_exact': countryExact.toString(),
        if (countryCode != null) 'countrycode': countryCode,
        if (state != null) 'state': state,
        if (stateExact != null) 'state_exact': stateExact.toString(),
        if (language != null) 'language': language,
        if (languageExact != null) 'language_exact': languageExact.toString(),
        if (tag != null) 'tag': tag,
        if (tagExact != null) 'tag_exact': tagExact.toString(),
        if (tagList != null) 'tag_list': tagList,
        if (codec != null) 'codec': codec,
        if (bitrateMin != null) 'bitrate_min': bitrateMin,
        if (bitrateMax != null) 'bitrate_max': bitrateMax,
        if (hasGeoInfo != null) 'has_geo_info': hasGeoInfo.toString(),
        if (hasExtendedInfo != null)
          'has_extended_info': hasExtendedInfo.toString(),
        if (isHttps != null) 'is_https': isHttps.toString(),
        if (parameters != null) ...parameters.toMap(),
      },
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      parameters,
    );
  }

  /// A list of radio stations that have an exact URL match.
  Future<RadioBrowserListResponse<Station>> getStationsByUrl({
    /// URL of the station
    required String url,
  }) async {
    assert(
      url.isNotEmpty,
      'Invalid url value; must not be empty',
    );

    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/byurl',
      queryParameters: {
        'url': url,
      },
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
    );
  }

  /// A list of the stations that are clicked the most.
  Future<RadioBrowserListResponse<Station>> getStationsByClicks({
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/topclick',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
    );
  }

  /// A list of the highest-voted stations.
  Future<RadioBrowserListResponse<Station>> getStationsByVotes({
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/topvote',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
    );
  }

  /// A list of stations that were clicked recently.
  Future<RadioBrowserListResponse<Station>> getStationsByRecentClick({
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/lastclick',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
    );
  }

  /// A list of stations that were added or changed recently.
  Future<RadioBrowserListResponse<Station>> getStationsByRecentChange({
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/lastchange',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
    );
  }

  /// A list of old versions of stations from the last 30 days,
  /// and you can also retrieve the history of a single station by its ID.
  /// They are not visible through any other API calls.
  /// Station ID can be an ID or a station UUID.
  Future<RadioBrowserListResponse<Station>> getOldStations({
    String? stationUUID,
    String? lastChangeUUID,
    int? limit,
  }) async {
    assert(
      limit == null || limit > 0,
      'Invalid limit value; must be > 0',
    );

    final uri = Uri(
      scheme: 'https',
      host: host,
      path:
          '/json/stations/changed${stationUUID != null ? '/$stationUUID' : ''}',
      queryParameters: {
        if (lastChangeUUID != null) 'lastChangeUUID': lastChangeUUID,
        if (limit != null) 'limit': limit.toString(),
      },
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
      InputParameters(
        limit: limit ?? 999999,
      ),
    );
  }

  /// A list of the stations that did not pass the connection test.
  Future<RadioBrowserListResponse<Station>> getBrokenStations({
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/broken',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(utf8.decode(response.bodyBytes)),
    );
  }

  /// Increase the vote count for the station by one. Can only be done by the
  /// same IP address for one station every 10 minutes. If it works,
  /// the changed station will be returned as result.
  Future<StationVote> voteForStation({
    required String stationUUID,
  }) async {
    assert(
      stationUUID.isNotEmpty,
      'Invalid stationUUID value; must not be empty',
    );

    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/vote/$stationUUID',
    );

    final response = await http.get(uri);
    return StationVote.fromJson(
        (jsonDecode(utf8.decode(response.bodyBytes)) as Map).cast());
  }

  /// Add a radio station to the database.
  Future<StationAdd> addStation({
    required String name,
    required String url,
    required String countryCode,
    String? homepage,
    String? favicon,
    String? state,
    String? language,
    String? tags,
    double? geoLat,
    double? geoLong,
  }) async {
    assert(
      name.isNotEmpty,
      'Invalid name value; must not be empty',
    );

    assert(
      url.isNotEmpty,
      'Invalid url value; must not be empty',
    );

    assert(
      countryCode.length == 2,
      'Invalid countryCode value; must not be empty',
    );

    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/add',
      queryParameters: {
        'name': name,
        'url': url,
        'country': countryCode,
        if (homepage != null) 'homepage': homepage,
        if (favicon != null) 'favicon': favicon,
        if (state != null) 'state': state,
        if (language != null) 'language': language,
        if (tags != null) 'tags': tags,
        if (geoLat != null) 'geo_lat': geoLat.toString(),
        if (geoLong != null) 'geo_long': geoLong.toString(),
      },
    );

    final response = await http.post(uri);
    return StationAdd.fromJson(
        (jsonDecode(utf8.decode(response.bodyBytes)) as Map).cast());
  }
}
