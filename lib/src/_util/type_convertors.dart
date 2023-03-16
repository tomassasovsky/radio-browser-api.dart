/// Convert a boolean value to an integer.
bool boolFromInt(int? value) => value == 1;

/// Convert an integer value to a boolean.
// ignore: avoid_positional_boolean_parameters
int intFromBool(bool? value) => (value ?? false) ? 1 : 0;

/// Convert a string to a null value if it is empty.
String? stringToNull(String? value) => (value?.isEmpty ?? true) ? null : value;

/// Convert a string to a null value if it is empty.
String stringToJson(String? value) => (value == null) ? '' : value;
