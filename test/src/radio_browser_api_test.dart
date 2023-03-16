// ignore_for_file: prefer_const_constructors
import 'package:radio_browser_api/radio_browser_api.dart';
import 'package:test/test.dart';

void main() {
  group('RadioBrowserApi', () {
    test('can be instantiated', () async {
      expect(RadioBrowserApi.austria(), isNotNull);

      final countries = await RadioBrowserApi.austria().getCountries();
      final stations = await RadioBrowserApi.austria()
          .getStationsByName(name: "America's Greatest 80s Hits");
      expect(countries, isNotNull);
      expect(stations, isNotNull);
    });
  });
}
