/// {@template input_parameters}
/// Input parameters for the API call
/// {@endtemplate}
class InputParameters {
  /// {@macro input_parameters}
  const InputParameters({
    this.order,
    this.reverse,
    this.hidebroken,
    this.offset,
    this.limit,
  })  : assert(
          order == null || order == 'name' || order == 'stationcount',
          'Invalid order value',
        ),
        assert(
          offset == null || offset >= 0,
          'Invalid offset value; must be greater than or equal to 0',
        ),
        assert(
          limit == null || limit >= 0,
          'Invalid limit value; must be greater than or equal to 0',
        );

  /// name of the attribute the result list will be sorted by
  /// possible values: name, stationcount
  final String? order;

  /// reverse the result list if set to true
  final bool? reverse;

  /// do not count broken stations
  final bool? hidebroken;

  /// starting value of the result list from the database. For example,
  /// if you want to do paging on the server side.
  final int? offset;

  /// number of returned datarows (stations) starting with offset
  final int? limit;

  /// Returns a map of the parameters
  Map<String, String> toMap() {
    return <String, String>{
      if (order != null) 'order': order!,
      if (reverse != null) 'reverse': reverse!.toString(),
      if (hidebroken != null) 'hidebroken': hidebroken!.toString(),
      if (offset != null) 'offset': offset!.toString(),
      if (limit != null) 'limit': limit!.toString(),
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
