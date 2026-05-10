import 'package:built_value/serializer.dart';
import 'package:http/http.dart';
import 'package:vamos_flutter/core/utils/reusable_multipart_file.dart';

class MultipartFileSerializer implements PrimitiveSerializer<MultipartFile> {
  @override
  MultipartFile deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    throw UnimplementedError();
  }

  @override
  Object serialize(Serializers serializers, MultipartFile object,
      {FullType specifiedType = FullType.unspecified}) {
    return object;
  }

  @override
  Iterable<Type> get types => [MultipartFile, ReusableMultipartFile];

  @override
  String get wireName => 'MultipartFile';
}
