import 'dart:convert';

import 'package:radio_browser_api/src/models/country.dart';
import 'package:test/test.dart';

void main() {
  final jsonData = jsonDecode('''
  {
    "name":"Andorra",
    "iso_3166_1":"AD",
    "stationcount":7
  }
  ''') as Map<String, dynamic>;

  group('StationCheck', () {
    test('fromJson', () {
      final country = Country.fromJson(jsonData);

      expect(country.name, 'Andorra');
      expect(country.iso31661, 'AD');
      expect(country.stationCount, 7);
    });

    test('toJson', () {
      final country = Country.fromJson(jsonData);
      final json = country.toJson();

      expect(json['name'], 'Andorra');
      expect(json['iso_3166_1'], 'AD');
      expect(json['stationcount'], 7);
    });
  });
}
