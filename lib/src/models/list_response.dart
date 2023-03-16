import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:radio_browser_api/src/models/input_parameters.dart';

/// {@template radio_browser_response}
/// A generic response from the Radio Browser API.
/// {@endtemplate}
class RadioBrowserListResponse<T> extends Equatable {
  /// {@macro radio_browser_response}
  const RadioBrowserListResponse({
    required this.error,
    required this.limit,
    required this.offset,
    required this.pages,
    required this.totalResults,
    required this.statusCode,
    required this.items,
    required this.version,
    required this.hidebroken,
  });

  /// {@macro radio_browser_response}
  /// A parser for the Radio Browser API response.
  /// Accepts a JSON Map and returns a [RadioBrowserListResponse] object.
  factory RadioBrowserListResponse.fromList(
    T Function(Map<dynamic, dynamic> map) itemParser,
    dynamic json, [
    InputParameters? parameters,
  ]) {
    // extract the results from the map
    late final List<Map<String, dynamic>> items;
    final mapResults = json;

    if (mapResults is List) {
      items = mapResults
          .cast<Map<dynamic, dynamic>>()
          .map((Map<dynamic, dynamic> item) => item.cast<String, dynamic>())
          .toList();
    } else if (mapResults is Map) {
      items = [mapResults.cast<String, dynamic>()];
    }

    // parse the results into a list of objects
    final parsedItems = items.map(itemParser).toList();

    return RadioBrowserListResponse(
      limit: parameters?.limit ?? 100000,
      offset: parameters?.offset ?? 0,
      hidebroken: parameters?.hidebroken ?? false,
      pages: 1,
      items: parsedItems,
      statusCode: 200,
      totalResults: parsedItems.length,
      version: '',
      error: '',
    );
  }

  /// {@macro radio_browser_response}
  /// A parser for the Radio Browser API response.
  /// Accepts a JSON String and returns a [RadioBrowserListResponse] object.
  factory RadioBrowserListResponse.fromJson(
    T Function(Map<dynamic, dynamic> map) itemParser,
    String source, [
    InputParameters? parameters,
  ]) =>
      RadioBrowserListResponse.fromList(
        itemParser,
        json.decode(source),
        parameters,
      );

  /// {@macro radio_browser_response}
  /// Convert this object to a JSON map.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
      'limit': limit,
      'offset': offset,
      'number_of_page_results': pages,
      'number_of_total_results': totalResults,
      'status_code': statusCode,
      'results': items,
      'hideBroken': hidebroken,
      'version': version,
    };
  }

  /// {@macro radio_browser_response}
  /// Convert this object to a JSON string.
  String toJson() => json.encode(toMap());

  /// A text string representing the status_code.
  final String error;

  /// The value of the limit filter specified, or 100 if not specified.
  final int limit;

  /// The value of the offset filter specified, or 0 if not specified.
  final int offset;

  /// The number of results on this page.
  final int pages;

  /// The number of total results matching the filter conditions specified.
  final int totalResults;

  /// An integer indicating the result of the request. Acceptable values are:
  /// 1:   OK
  /// 100: Invalid API Key
  /// 101: Object Not Found
  /// 102: Error in URL Format
  /// 103: 'jsonp' format requires a 'json_callback' argument
  /// 104: Filter Error
  /// 105: Subscriber only video is for subscribers only
  final int statusCode;

  /// Zero or more items that match the filters specified.
  final List<T> items;

  /// The version of the API used to generate the response.
  final String version;

  /// The value of the hidebroken filter specified, or false if not specified.
  final bool hidebroken;

  @override
  String toString() {
    return '''
    RadioBrowserListResponse(
      error: $error,
      limit: $limit,
      offset: $offset,
      pageResults: $pages,
      totalResults: $totalResults,
      statusCode: $statusCode,
      results: $items,
      hideBroken: $hidebroken,
      version: $version
    )
    ''';
  }

  @override
  List<Object?> get props {
    return [
      error,
      limit,
      offset,
      pages,
      totalResults,
      statusCode,
      items,
      version,
    ];
  }
}
