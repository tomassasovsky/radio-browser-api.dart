import 'dart:convert';

import 'package:radio_browser_api/src/models/station_check.dart';
import 'package:test/test.dart';

void main() {
  final jsonData = jsonDecode('''
  {
    "stationuuid":"960e57c5-0601-11e8-ae97-52543be04c81",
    "checkuuid":"18be4561-309a-11ea-b37a-0242ac120002",
    "source":"at1.api.radio-browser.info",
    "codec":"MP3",
    "bitrate":128,
    "hls":0,
    "ok":1,
    "timestamp":"2020-01-06 15:34:58",
    "timestamp_iso8601":"2020-01-06T15:34:58Z",
    "urlcache":"http://stream.example.com/mp3_128",
    "metainfo_overrides_database":0,
    "public":null,
    "name":null,
    "description":null,
    "tags":null,
    "countrycode":null,
    "countrysubdivisioncode": null,
    "homepage":null,
    "favicon":null,
    "loadbalancer":null,
    "server_software": "Icecast 2.4.0",
    "sampling": 44100,
    "timing_ms": 495,
    "languagecodes": null,
    "ssl_error": 0,
    "geo_lat": 1.1,
    "geo_long": -2.2
  }
  ''') as Map<String, dynamic>;

  group('StationCheck', () {
    test('fromJson', () {
      final stationCheck = StationCheck.fromJson(jsonData);

      expect(stationCheck.checkUUID, '18be4561-309a-11ea-b37a-0242ac120002');
      expect(stationCheck.stationUUID, '960e57c5-0601-11e8-ae97-52543be04c81');
      expect(stationCheck.source, 'at1.api.radio-browser.info');
      expect(stationCheck.codec, 'MP3');
      expect(stationCheck.bitrate, 128);
      expect(stationCheck.hls, false);
      expect(stationCheck.ok, true);
      expect(
        stationCheck.timestamp,
        DateTime.parse('2020-01-06 15:34:58'),
      );
      expect(stationCheck.urlCache, 'http://stream.example.com/mp3_128');
      expect(stationCheck.metainfoOverridesDatabase, false);
      expect(stationCheck.public, false);
      expect(stationCheck.name, null);
      expect(stationCheck.description, null);
      expect(stationCheck.tags, null);
      expect(stationCheck.countryCode, null);
      expect(stationCheck.countrysubdivisioncode, null);
      expect(stationCheck.homepage, null);
      expect(stationCheck.favicon, null);
      expect(stationCheck.loadbalancer, null);
      expect(stationCheck.serverSoftware, 'Icecast 2.4.0');
      expect(stationCheck.sampling, 44100);
      expect(stationCheck.timingMilliseconds, 495);
      expect(stationCheck.languageCodes, null);
      expect(stationCheck.sslError, false);
      expect(stationCheck.geoLat, 1.1);
      expect(stationCheck.geoLong, -2.2);
    });

    test('toJson', () {
      final stationCheck = StationCheck.fromJson(jsonData);
      final json = stationCheck.toJson();

      expect(json['checkuuid'], '18be4561-309a-11ea-b37a-0242ac120002');
      expect(json['stationuuid'], '960e57c5-0601-11e8-ae97-52543be04c81');
      expect(json['source'], 'at1.api.radio-browser.info');
      expect(json['codec'], 'MP3');
      expect(json['bitrate'], 128);
      expect(json['hls'], 0);
      expect(json['ok'], 1);
      expect(json['timestamp'], '2020-01-06T15:34:58.000');
      expect(json['urlcache'], 'http://stream.example.com/mp3_128');
      expect(json['metainfo_overrides_database'], 0);
      expect(json['public'], 0);
      expect(json['name'], null);
      expect(json['description'], null);
      expect(json['tags'], null);
      expect(json['countrycode'], null);
      expect(json['countrysubdivisioncode'], null);
      expect(json['homepage'], null);
      expect(json['favicon'], '');
      expect(json['loadbalancer'], null);
      expect(json['server_software'], 'Icecast 2.4.0');
      expect(json['sampling'], 44100);
      expect(json['timing_ms'], 495);
      expect(json['languagecodes'], null);
      expect(json['ssl_error'], 0);
      expect(json['geo_lat'], 1.1);
      expect(json['geo_long'], -2.2);
    });
  });
}
