// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

class GGetAppConfigData {
  const GGetAppConfigData({
    required this.appConfig,
    this.G__typename = 'Query',
  });

  factory GGetAppConfigData.fromJson(Map<String, dynamic> json) {
    return GGetAppConfigData(
      appConfig: GGetAppConfigData_appConfig.fromJson(
          (json['appConfig'] as Map<String, dynamic>)),
      G__typename: (json['__typename'] as String),
    );
  }

  final GGetAppConfigData_appConfig appConfig;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['appConfig'] = this.appConfig.toJson();
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetAppConfigData copyWith({
    GGetAppConfigData_appConfig? appConfig,
    String? G__typename,
  }) {
    return GGetAppConfigData(
      appConfig: appConfig ?? this.appConfig,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetAppConfigData &&
            appConfig == other.appConfig &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, appConfig, G__typename);
  }

  @override
  String toString() {
    return 'GGetAppConfigData(appConfig: $appConfig, G__typename: $G__typename)';
  }
}

class GGetAppConfigData_appConfig {
  const GGetAppConfigData_appConfig({
    required this.imageBaseUrl,
    this.G__typename = 'AppConfigType',
  });

  factory GGetAppConfigData_appConfig.fromJson(Map<String, dynamic> json) {
    return GGetAppConfigData_appConfig(
      imageBaseUrl: (json['imageBaseUrl'] as String),
      G__typename: (json['__typename'] as String),
    );
  }

  final String imageBaseUrl;

  final String G__typename;

  Map<String, dynamic> toJson() {
    final _$result = <String, dynamic>{};
    _$result['imageBaseUrl'] = this.imageBaseUrl;
    _$result['__typename'] = this.G__typename;
    return _$result;
  }

  GGetAppConfigData_appConfig copyWith({
    String? imageBaseUrl,
    String? G__typename,
  }) {
    return GGetAppConfigData_appConfig(
      imageBaseUrl: imageBaseUrl ?? this.imageBaseUrl,
      G__typename: G__typename ?? this.G__typename,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is GGetAppConfigData_appConfig &&
            imageBaseUrl == other.imageBaseUrl &&
            G__typename == other.G__typename);
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, imageBaseUrl, G__typename);
  }

  @override
  String toString() {
    return 'GGetAppConfigData_appConfig(imageBaseUrl: $imageBaseUrl, G__typename: $G__typename)';
  }
}
