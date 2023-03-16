import 'dart:convert';

import 'package:radio_browser_api/src/models/station_check_step.dart';
import 'package:test/test.dart';

void main() {
  final jsonData = jsonDecode('''
  {
    "stepuuid": "01234567-89ab-cdef-0123-456789abcdef",
    "parent_stepuuid": "01234567-89ab-cdef-0123-456789abcdef",
    "checkuuid": "01234567-89ab-cdef-0123-456789abcdef",
    "stationuuid": "01234567-89ab-cdef-0123-456789abcdef",
    "url": "http://stream.example.com:8000/streamname",
    "urltype": "STREAM",
    "error": "BadError",
    "creation_iso8601": "2021-04-13T20:11:19Z"
  }
  ''') as Map<String, dynamic>;

  group('StationCheck', () {
    test('fromJson', () {
      final stationCheck = StationCheckStep.fromJson(jsonData);

      expect(stationCheck.stepUUID, '01234567-89ab-cdef-0123-456789abcdef');
      expect(
        stationCheck.parentStepUUID,
        '01234567-89ab-cdef-0123-456789abcdef',
      );
      expect(stationCheck.checkUUID, '01234567-89ab-cdef-0123-456789abcdef');
      expect(stationCheck.stationUUID, '01234567-89ab-cdef-0123-456789abcdef');
      expect(stationCheck.url, 'http://stream.example.com:8000/streamname');
      expect(stationCheck.urlType, 'STREAM');
      expect(stationCheck.error, 'BadError');
      expect(
        stationCheck.creationTimestamp,
        DateTime.parse('2021-04-13T20:11:19Z'),
      );
    });

    test('toJson', () {
      final stationCheck = StationCheckStep.fromJson(jsonData);
      final json = stationCheck.toJson();

      expect(json['stepuuid'], '01234567-89ab-cdef-0123-456789abcdef');
      expect(
        json['parent_stepuuid'],
        '01234567-89ab-cdef-0123-456789abcdef',
      );
      expect(json['checkuuid'], '01234567-89ab-cdef-0123-456789abcdef');
      expect(json['stationuuid'], '01234567-89ab-cdef-0123-456789abcdef');
      expect(json['url'], 'http://stream.example.com:8000/streamname');
      expect(json['urltype'], 'STREAM');
      expect(json['error'], 'BadError');
      expect(json['creation_iso8601'], '2021-04-13T20:11:19.000Z');
    });
  });
}
