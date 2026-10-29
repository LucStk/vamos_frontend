import 'package:gql_tristate_value/gql_tristate_value.dart';

Value<T> toFerryValue<T extends Object>(T? value) =>
    value == null ? Value<T>.absent() : Value<T>.present(value);
