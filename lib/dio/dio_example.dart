import 'package:diointerceptorexample2/dio/dio_client.dart';
import 'package:diointerceptorexample2/dio/post.dart';
import 'package:flutter/cupertino.dart';

class DioExample extends StatefulWidget{
  const DioExample({Key? key}) : super(key: key);

  
  @override
  State<StatefulWidget> createState() => _DioExampleState();
}

class _DioExampleState extends State<DioExample>{
  var requesting = false;
  late DioClient dioClient;
  late Future<Post> post;
  late Future<List<Post>> posts;

@override
  void initState() {
    super.initState();
    dioClient = DioClient();

   //DioClient.dio.interceptors.add(InterceptosWrapper(onRequest: (options, handler){
   //return handler.next(options);
   //return handler.resolve(Response(requestOptions: options, data: 'fake data'));
   //}, onResponse: (response, handler){
   //return handler.next(response);
   //} onError: (DioError e, handler){
   //return handler.next(e); tbm pode utilizar handler.reject(dioError)
   //}));

  // DioClient.dio.interceptors.addAll([]);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}