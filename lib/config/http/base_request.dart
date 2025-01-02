import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/app_util.dart';
import 'package:flutter_demo/utils/toast_util.dart';
import 'package:flutter_demo/view_model/app_vm.dart';
import 'package:provider/provider.dart';

class BaseRequest {
  static final BaseRequest _instance = BaseRequest._internal();
  late Dio dio;
  bool isShowLoading = false;
  static Duration duration = const Duration(seconds: 10);
  static const String baseUrl = "https://itunes.apple.com";

  // CancelToken cancelToken = CancelToken();

  factory BaseRequest() => _instance;

  BaseRequest._internal() {
    dio = Dio(
      BaseOptions(baseUrl: baseUrl, connectTimeout: duration, receiveTimeout: duration),
    );
    interceptor();
  }

  ///request interceptor
  void interceptor() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          if (_isNoNet) return;
          debugPrint("[\n================== 请求数据 =============${options.path}=============");
          debugPrint("url = ${options.uri.toString()}");
          debugPrint("headers = ${options.headers}");
          debugPrint("method = ${options.method}");
          debugPrint("params = ${options.data}");
          debugPrint("]");
          handler.next(options);
          if (isShowLoading) {
            ToastUtil.showCustomLoadingToast(seconds: duration.inSeconds, clickClose: false);
          }
          // Toast.showLoadingToast(seconds: 10, clickClose: false);
          // cancelToken.cancel();
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) async {
          debugPrint("[🙋\n================== Handle Data =================${response.requestOptions.path}==========");
          debugPrint("code = ${response.statusCode}");
          debugPrint("data = ${response.data}");
          debugPrint("]");

          await Future.delayed(const Duration(milliseconds: 600), () {
            ToastUtil.closeLoading();
          });
          handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          debugPrint("\n================== 错误响应数据 =========${e.requestOptions.path}=============");
          debugPrint("type = ${e.type}");
          debugPrint("message = ${e.message}");
          debugPrint("response data = ${e.response?.data}");
          debugPrint("\n");

          /*error统一处理*/
          if (e.type == DioExceptionType.connectionTimeout) {
            ToastUtil.showBottomToast("Connection Timeout");
          } else if (e.type == DioExceptionType.sendTimeout) {
            ToastUtil.showBottomToast("SendTimeout");
          } else if (e.type == DioExceptionType.receiveTimeout) {
            ToastUtil.showBottomToast("Receive Timeout");
          } else if (e.type == DioExceptionType.badResponse) {
            ToastUtil.showBottomToast("Url not found");
          } else if (e.type == DioExceptionType.cancel) {
            ToastUtil.showBottomToast("cancel");
          } else {
            ToastUtil.showBotToast("Error");
          }
          Future.delayed(const Duration(milliseconds: 2000), () {
            ToastUtil.closeLoading();
          });
          handler.resolve(e.response!);
        },
      ),
    );
    // dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  ///get
  Future<Response> toGet(
    url, {
    Map<String, dynamic>? parameters,
    Options? options,
    bool isShowLoading = true,
  }) async {
    this.isShowLoading = isShowLoading;
    var res = await dio.get(url, queryParameters: parameters, options: options).timeout(duration);

    return res;
  }

  ///post
  Future<Response> toPost(
    url, {
    data,
    Map<String, dynamic>? parameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
    bool isShowLoading = true,
  }) async {
    this.isShowLoading = isShowLoading;
    return await dio
        .post(url, queryParameters: parameters, options: options, data: data, cancelToken: cancelToken)
        .timeout(duration);
  }

  Future<Response?> toPut(
    url, {
    data,
    Map<String, dynamic>? parameters,
    Options? options,
    bool isShowLoading = true,
  }) async {
    this.isShowLoading = isShowLoading;
    return await dio.put(url, queryParameters: parameters, options: options, data: data).timeout(duration);
  }

  Future<Response?> toDelete(
    url, {
    data,
    Map<String, dynamic>? parameters,
    Options? options,
    bool isShowLoading = true,
  }) async {
    this.isShowLoading = isShowLoading;
    return await dio.delete(url, queryParameters: parameters, options: options, data: data).timeout(duration);
  }

  bool isNoNet() {
    bool noNet = AppUtils.context.read<AppViewModel>().model.noNetwork;
    if (noNet) ToastUtil.showBotToast("Network Error");
    return noNet;
  }

  bool get _isNoNet => isNoNet();
}
