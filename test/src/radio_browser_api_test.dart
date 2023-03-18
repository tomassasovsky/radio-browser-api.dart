// ignore_for_file: prefer_const_constructors
import 'package:radio_browser_api/radio_browser_api.dart';
import 'package:test/test.dart';

void main() {
  group('RadioBrowserApi', () {
    test('can be instantiated', () async {
      expect(RadioBrowserApi.fromHost('de1.api.radio-browser.info'), isNotNull);

      final countries =
          await RadioBrowserApi.fromHost('de1.api.radio-browser.info')
              .getCountries();
      final stations =
          await RadioBrowserApi.fromHost('de1.api.radio-browser.info')
              .getStationsByName(name: "America's Greatest 80s Hits");
      expect(countries, isNotNull);
      expect(stations, isNotNull);
    });
  });
}
