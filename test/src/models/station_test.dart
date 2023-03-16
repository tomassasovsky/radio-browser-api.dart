import 'dart:convert';

import 'package:radio_browser_api/src/models/station.dart';
import 'package:test/test.dart';

void main() {
  final jsonData = jsonDecode('''
  {
    "changeuuid": "c70a7f1a-f9dc-11e9-aa83-b2b0694ed6a2",
    "stationuuid": "f70a7f1a-f9dc-11e9-aa83-b2b0694ed6a2",
    "serveruuid": null,
    "name": "Test Radio Station",
    "url": "http://test-radio-station.com/stream",
    "url_resolved": "http://test-radio-station.com/stream",
    "homepage": "http://test-radio-station.com",
    "favicon": "http://test-radio-station.com/icon.png",
    "tags": "test, radio, station",
    "country": "United States",
    "countrycode": "US",
    "state": "California",
    "language": "English",
    "languagecodes": "eng",
    "votes": 100,
    "lastchangetime": "2020-01-01T00:00:00.000Z",
    "codec": "mp3",
    "bitrate": 128,
    "hls": 0,
    "lastcheckok": 1,
    "lastchecktime": "2020-01-01T00:00:00.000Z",
    "lastcheckoktime": "2020-01-01T00:00:00.000Z",
    "lastlocalchecktime": "2020-01-01T00:00:00.000Z",
    "clicktimestamp": "2020-01-01T00:00:00.000Z",
    "clickcount": 100,
    "clicktrend": 100,
    "ssl_error": 0,
    "geo_lat": 0,
    "geo_long": 0,
    "has_extended_info": true
  }
  ''') as Map<String, dynamic>;

  final jsonDataRecent = jsonDecode('''
  {
    "changeuuid": "8df7db2f-7fb2-4cd8-9da7-4e6814f07dab",
    "stationuuid": "3ca95d0d-4130-43ec-9a89-6b619ae4712a",
    "serveruuid": null,
    "name": "WCDQ Country 106.3 FM",
    "url": "https://forcht.streamguys1.com/wcdq-fm",
    "url_resolved": "",
    "homepage": "",
    "favicon": "",
    "tags": "",
    "country": "The United States Of America",
    "countrycode": "US",
    "state": "",
    "language": "",
    "languagecodes": "",
    "votes": 0,
    "lastchangetime": "2023-02-07 01:02:55",
    "codec": "",
    "bitrate": 0,
    "hls": 0,
    "lastcheckok": 1,
    "lastchecktime": "",
    "lastcheckoktime": "",
    "lastlocalchecktime": "",
    "clicktimestamp": "",
    "clickcount": 0,
    "clicktrend": 0,
    "ssl_error": 0,
    "geo_lat": null,
    "geo_long": null,
    "has_extended_info": false
  }
  ''') as Map<String, dynamic>;

  group('Station', () {
    test('fromJson all filled out', () {
      final station = Station.fromJson(jsonData);

      expect(station.changeUUID, 'c70a7f1a-f9dc-11e9-aa83-b2b0694ed6a2');
      expect(station.stationUUID, 'f70a7f1a-f9dc-11e9-aa83-b2b0694ed6a2');
      expect(station.name, 'Test Radio Station');
      expect(station.url, 'http://test-radio-station.com/stream');
      expect(station.urlResolved, 'http://test-radio-station.com/stream');
      expect(station.homepage, 'http://test-radio-station.com');
      expect(station.favicon, 'http://test-radio-station.com/icon.png');
      expect(station.tags, 'test, radio, station');
      // ignore: deprecated_member_use_from_same_package
      expect(station.country, 'United States');
      expect(station.countryCode, 'US');
      expect(station.state, 'California');
      expect(station.language, 'English');
      expect(station.languageCodes, 'eng');
      expect(station.votes, 100);
      expect(
        station.lastChangeTime,
        DateTime.parse('2020-01-01T00:00:00.000Z'),
      );
      expect(station.codec, 'mp3');
      expect(station.bitrate, 128);
      expect(station.hls, false);
      expect(station.lastCheckOk, true);
      expect(station.lastCheckTime, DateTime.parse('2020-01-01T00:00:00.000Z'));
      expect(
        station.lastCheckOkTime,
        DateTime.parse('2020-01-01T00:00:00.000Z'),
      );
      expect(
        station.lastLocalCheckTime,
        DateTime.parse('2020-01-01T00:00:00.000Z'),
      );
      expect(
        station.clickTimestamp,
        DateTime.parse('2020-01-01T00:00:00.000Z'),
      );
      expect(station.clickCount, 100);
      expect(station.clickTrend, 100);
      expect(station.sslError, false);
      expect(station.geoLat, 0);
      expect(station.geoLong, 0);
      expect(station.hasExtendedInfo, true);
    });

    test('fromJson recent and incomplete', () {
      final station = Station.fromJson(jsonDataRecent);

      expect(station.changeUUID, '8df7db2f-7fb2-4cd8-9da7-4e6814f07dab');
      expect(station.stationUUID, '3ca95d0d-4130-43ec-9a89-6b619ae4712a');
      expect(station.name, 'WCDQ Country 106.3 FM');
      expect(station.url, 'https://forcht.streamguys1.com/wcdq-fm');
      expect(station.urlResolved, null);
      expect(station.homepage, null);
      expect(station.favicon, null);
      expect(station.tags, null);
      // ignore: deprecated_member_use_from_same_package
      expect(station.country, 'The United States Of America');
      expect(station.countryCode, 'US');
      expect(station.state, null);
      expect(station.language, null);
      expect(station.languageCodes, null);
      expect(station.votes, 0);
      expect(
        station.lastChangeTime,
        DateTime.parse('2023-02-07 01:02:55'),
      );
      expect(station.codec, null);
      expect(station.bitrate, 0);
      expect(station.hls, false);
      expect(station.lastCheckOk, true);
      expect(station.lastCheckTime, null);
      expect(station.lastCheckOkTime, null);
      expect(station.lastLocalCheckTime, null);
      expect(station.clickTimestamp, null);
      expect(station.clickCount, 0);
      expect(station.clickTrend, 0);
      expect(station.sslError, false);
      expect(station.geoLat, null);
      expect(station.geoLong, null);
      expect(station.hasExtendedInfo, false);
    });

    test('toJson all filled out', () {
      final station = Station(
        changeUUID: 'c70a7f1a-f9dc-11e9-aa83-b2b0694ed6a2',
        stationUUID: 'f70a7f1a-f9dc-11e9-aa83-b2b0694ed6a2',
        serverUUID: null,
        name: 'Test Radio Station',
        url: 'http://test-radio-station.com/stream',
        urlResolved: 'http://test-radio-station.com/stream',
        homepage: 'http://test-radio-station.com',
        favicon: 'http://test-radio-station.com/icon.png',
        tags: 'test, radio, station',
        country: 'United States',
        countryCode: 'US',
        state: 'California',
        language: 'English',
        languageCodes: 'eng',
        votes: 100,
        lastChangeTime: DateTime.parse('2020-01-01T00:00:00.000Z'),
        codec: 'mp3',
        bitrate: 128,
        hls: false,
        lastCheckOk: true,
        lastCheckTime: DateTime.parse('2020-01-01T00:00:00.000Z'),
        lastCheckOkTime: DateTime.parse('2020-01-01T00:00:00.000Z'),
        lastLocalCheckTime: DateTime.parse('2020-01-01T00:00:00.000Z'),
        clickTimestamp: DateTime.parse('2020-01-01T00:00:00.000Z'),
        clickCount: 100,
        clickTrend: 100,
        sslError: false,
        geoLat: 0,
        geoLong: 0,
        hasExtendedInfo: true,
      );

      expect(station.toJson(), jsonData);
    });
  });
}
