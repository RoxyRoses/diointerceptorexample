import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //add id to private endpoint and supposes the path contains open in public
    if (!options.path.contains("open")) {
      options.queryParameters['userId'] = 'xxx';
    } 

    //validate user and append the token
    options.headers['token'] = 'xxx';

    //requesting a fresh token
    if(options.headers['refreshToken'] == null){
      //DioClient.dio.lock();
      Dio _tokenDio = Dio();
      _tokenDio.get('/token').then((value) => {
        options.headers['refreshToken'] = value.data['data']['token'],
        handler.next(options)
      }).catchError((onError){
        handler.reject(onError, true);
      }).whenComplete(() => {
      //DioClient.dio.unlock();
      });
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {

    } else {
      if(response.requestOptions.baseUrl.contains('secret')){
        return super.onResponse(response, handler);
      }
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type){
      case DioErrorType.connectTimeout:
       {}
       break;
      case DioErrorType.receiveTimeout:
      {}
      break;
      case DioErrorType.sendTimeout:
      {}
      break;
      case DioErrorType.cancel:
      {}
      break;
      case DioErrorType.response:
      {}
      break;
      case DioErrorType.other:
      {}
      break;
    }
    super.onError(err, handler);
  }
}
