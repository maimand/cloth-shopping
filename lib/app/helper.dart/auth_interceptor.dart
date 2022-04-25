// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:get_storage/get_storage.dart';


// class DioInterceptors extends InterceptorsWrapper {
//   final Dio _dio;
//   final _store = GetStorage();
//   String _accessToken = '';

//   DioInterceptors(this._dio);

//   @override
//   Future onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     if (!options.path.contains(Endpoints.REFRESH_TOKEN)) {
//       _checkToken(options);
//     }
//     //
//     DeviceInfoModel? _device;
//     final deviceInfoStorage= _store.read(AppStorageKey.DEVICE_INFO);
//     if(deviceInfoStorage!=null){
//       _device = DeviceInfoModel.fromJson(deviceInfoStorage);
//     }
//     String deviceInfo =
//     _device != null ? "${_device.id},${_device.name};os/${_device.os}" : "";
//     //
//     LocationModel? _location;
//     final locationStorage= _store.read(AppStorageKey.LOCATION);
//     if(locationStorage!=null){
//       _location = LocationModel.fromJson(locationStorage);
//     }
//     String locationInfo = _location != null
//         ? "${_location.administrativeArea}-${_location.country}"
//         : "";
//     //
//     options.headers.addAll({
//       HttpHeaders.authorizationHeader:
//       '${AppStorageKey.TOKEN_TYPE} $_accessToken',
//       'platform': 'mobile',
//       HttpCustomHeader.Cleesky_Device_Agent:
//       "device/$deviceInfo;location/$locationInfo"
//     });
//     handler.next(options);
//   }

//   Future<void> _checkToken(RequestOptions options) async {
//     String accessToken = _store.read(AppStorageKey.ACCESS_TOKEN) ?? '';
//     if (accessToken.isEmpty) {
//       return;
//     }
//     String expiredTimeString =
//         _store.read(AppStorageKey.ACCESS_TOKEN_EXPIRED_TIME);
//     DateTime expiredTime = DateTime.parse(expiredTimeString);
//     if (DateTime.now().isAfter(expiredTime)) {
//       await _refreshTokenAndRecallApi(options);
//     } else {
//       _accessToken = accessToken;
//     }
//   }

//   Future<void> _refreshTokenAndRecallApi(RequestOptions options) async {
//     _dio.interceptors.requestLock.lock();
//     _dio.interceptors.responseLock.lock();
//     try {
//       String refreshToken = _store.read(AppStorageKey.REFRESH_TOKEN) ?? '';
//       final RefreshTokenResponse? tokenData =
//           await _authController.refreshToken(refreshToken);
//       //
//       await _authController.setTokens(
//         accessToken: tokenData!.accessToken,
//         refreshToken: tokenData.refreshToken,
//         expiredDuration: tokenData.expiresIn,
//       );
//       _accessToken = tokenData.accessToken;
//       //Recall api before refresh token
//       options.headers.addAll({
//         HttpHeaders.authorizationHeader:
//             '${AppStorageKey.TOKEN_TYPE} $_accessToken'
//       });
//       final newOptions = new Options(
//         method: options.method,
//         headers: options.headers,
//         contentType: options.contentType,
//         extra: options.extra,
//         followRedirects: options.followRedirects,
//         listFormat: options.listFormat,
//         maxRedirects: options.maxRedirects,
//         receiveDataWhenStatusError: options.receiveDataWhenStatusError,
//         receiveTimeout: options.receiveTimeout,
//         responseType: options.responseType,
//         responseDecoder: options.responseDecoder,
//         requestEncoder: options.requestEncoder,
//         sendTimeout: options.sendTimeout,
//         validateStatus: options.validateStatus,
//       );
//       _dio.request(
//         options.path,
//         data: options.data,
//         queryParameters: options.queryParameters,
//         cancelToken: options.cancelToken,
//         onReceiveProgress: options.onReceiveProgress,
//         onSendProgress: options.onSendProgress,
//         options: newOptions,
//       );
//     } catch (e) {
//       _authController.logout();
//     }
//     _dio.interceptors.requestLock.unlock();
//     _dio.interceptors.responseLock.unlock();
//   }
// }
