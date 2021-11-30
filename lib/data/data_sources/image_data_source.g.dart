// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_data_source.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ImageDataSource implements ImageDataSource {
  _ImageDataSource(this._dio, {this.baseUrl}) {
    baseUrl ??=
        'https://pixabay.com/api/?key=20538360-eb1ecea8923bff97baeb9430a';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ImageBody> fetchImages() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ImageBody>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ImageBody.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
