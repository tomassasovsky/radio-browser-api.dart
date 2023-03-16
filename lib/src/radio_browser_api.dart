import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:radio_browser_api/src/models/codec.dart';
import 'package:radio_browser_api/src/models/country.dart';
import 'package:radio_browser_api/src/models/input_parameters.dart';
import 'package:radio_browser_api/src/models/language.dart';
import 'package:radio_browser_api/src/models/list_response.dart';
import 'package:radio_browser_api/src/models/state.dart';
import 'package:radio_browser_api/src/models/station.dart';
import 'package:radio_browser_api/src/models/tag.dart';

/// {@template radio_browser_api}
/// An HTTP client for Radio Browser
/// {@endtemplate}
class RadioBrowserApi {
  /// {@macro radio_browser_api}
  const RadioBrowserApi.germany() : host = 'de1.api.radio-browser.info';

  /// {@macro radio_browser_api}
  const RadioBrowserApi.france() : host = 'fr1.api.radio-browser.info';

  /// {@macro radio_browser_api}
  const RadioBrowserApi.austria() : host = 'at1.api.radio-browser.info';

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
      jsonDecode(response.body),
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
      jsonDecode(response.body),
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
      jsonDecode(response.body),
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
      jsonDecode(response.body),
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
      jsonDecode(response.body),
      parameters,
    );
  }

  /// Returns a list of all stations in the database that match with the
  /// provided UUID.
  Future<RadioBrowserListResponse<Station>> getStationsByUUID({
    /// UUID of the station to search for
    required String uuid,
    InputParameters? parameters,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: host,
      path: '/json/stations/byuuid/$uuid',
      queryParameters: parameters?.toMap(),
    );

    final response = await http.get(uri);
    return RadioBrowserListResponse.fromList(
      (Map<dynamic, dynamic> map) => Station.fromJson(map.cast()),
      jsonDecode(response.body),
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
      jsonDecode(response.body),
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
      jsonDecode(response.body),
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
      jsonDecode(response.body),
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
      jsonDecode(response.body),
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
      jsonDecode(response.body),
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
      jsonDecode(response.body),
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
      jsonDecode(response.body),
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
      jsonDecode(response.body),
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
      jsonDecode(response.body),
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
      jsonDecode(response.body),
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
      jsonDecode(response.body),
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
      jsonDecode(response.body),
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
      jsonDecode(response.body),
      parameters,
    );
  }
}
