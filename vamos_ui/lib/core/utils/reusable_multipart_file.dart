import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

/// A [http.MultipartFile] that can be finalized multiple times.
/// This is useful when using Ferry/GQL with retry logic (like ErrorLink),
/// as the standard [http.MultipartFile] throws an error if finalized more than once.
class ReusableMultipartFile extends http.MultipartFile {
  final List<int> _bytes;

  ReusableMultipartFile.fromBytes(
    String field,
    List<int> value, {
    String? filename,
    MediaType? contentType,
  })  : _bytes = value,
        super(
          field,
          Stream.fromIterable([value]),
          value.length,
          filename: filename,
          contentType: contentType,
        );

  @override
  http.ByteStream finalize() {
    // Return a new stream from the same bytes every time finalize is called.
    return http.ByteStream(Stream.fromIterable([_bytes]));
  }
}
