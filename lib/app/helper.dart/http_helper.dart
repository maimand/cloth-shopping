import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class HttpResponse<T> {
  HttpResponse({
    this.body,
    this.headers,
    this.request,
    this.statusCode,
    this.statusMessage,
    this.extra,
  });

  T? body;
  Headers? headers;
  RequestOptions? request;
  int? statusCode;
  String? statusMessage;
  Map<String, dynamic>? extra;
}

class HttpHelper {
  static getDio() {
    Dio _dio = Dio();
    // _dio.interceptors.add(DioInterceptors(_dio));
    return _dio;
  }

  static String? getUriQueryParam(Uri uri, String key) {
    final queryParams = uri.queryParametersAll.entries.toList();
    if (queryParams.any((_) => _.key == key)) {
      return queryParams.firstWhere((_) => _.key == key).value.first;
    }
    return null;
  }

  static FormData mapToFormData(Map<String, dynamic> map) {
    final formData = FormData.fromMap(map);
    final FormData newData = FormData();

    ///
    formData.fields.forEach((element) {
      newData.fields.add(MapEntry(element.key, element.value));
    });

    ///
    formData.files.forEach((element) {
      if (element.key.contains('[') || element.key.contains(']')) {
        final newKey =
            element.key.replaceAllMapped(RegExp('(\[+[a-zA-Z]+\])'), (m) {
          return '${m[0]}'.replaceAll('[', '.').replaceAll(']', '');
        });
        final newValue = element.value;
        final newEntry = MapEntry(newKey, newValue);
        newData.files.add(newEntry);
      } else {
        newData.files.add(element);
      }
    });
    return newData;
  }

  static Future<HttpResponse> get(String url,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    final Dio dio = HttpHelper.getDio();
    debugPrint("--[GET]--: ${url}");
    final Response response = await dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
    );
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  ///
  /// Return the stored File path in the TemporaryDirectory
  ///
  static Future<String> downloadFile(String url,
      {ProgressCallback? onReceiveProgress,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    final Dio dio = HttpHelper.getDio();
    debugPrint("--[DOWNLOAD]--: ${url}");
    final tempDir = await getTemporaryDirectory();
    String filename = '';
    return await dio.download(
      url,
      (Headers headers) {
        List<String> tokens = headers.value('content-disposition')!.split(";");
        for (var i = 0; i < tokens.length; i++) {
          if (tokens[i].contains('filename')) {
            filename = tokens[i]
                .substring(tokens[i].indexOf("=") + 1, tokens[i].length);
          }
        }
        filename = Uri.decodeFull(filename).replaceAll("UTF-8''", '');
        return '${tempDir.path}/$filename';
      },
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: options,
    ).then((response) {
      return '${tempDir.path}/$filename';
    }, onError: (e) {
      throw e;
    });
  }

  static Future<HttpResponse> post(String url,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? formData}) async {
    final Dio dio = HttpHelper.getDio();
    debugPrint("--[POST]--: ${url}");
    if (formData != null) {
      data = HttpHelper.mapToFormData(formData);
    }
    final Response response = await dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  static Future<HttpResponse> put(String url,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? formData}) async {
    final Dio dio = HttpHelper.getDio();
    if (formData != null) {
      data = HttpHelper.mapToFormData(formData);
    }

    debugPrint("--[PUT]--: ${url}");
    final Response response = await dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  static Future<HttpResponse> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final Dio dio = HttpHelper.getDio();
    debugPrint("--[DELETE]--: ${url}");
    final Response response = await dio.delete(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return HttpResponse(
      body: response.data,
      headers: response.headers,
      request: response.requestOptions,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      extra: response.extra,
    );
  }

  // static Future<HttpResponse> uploadFile(String url,
  //     {required File file, Map<String, dynamic>? extraData}) async {
  //   final mediaType = FileHelper.getMediaType(file);
  //   final Dio dio = HttpHelper.getDio();
  //   final uploadFile = await MultipartFile.fromFile(
  //     file.path,
  //     filename: basename(file.path),
  //     contentType: mediaType,
  //   );
  //   final formData = FormData.fromMap({'file': uploadFile});

  //   extraData!.forEach((key, value) {
  //     formData.fields
  //       ..add(MapEntry(
  //         '$key',
  //         '$value',
  //       ));
  //   });

  //   final Response response = await dio.post(url, data: formData);
  //   return HttpResponse(
  //     body: response.data,
  //     headers: response.headers,
  //     statusCode: response.statusCode,
  //     statusMessage: response.statusMessage,
  //     extra: response.extra,
  //   );
  // }
}
