import 'package:dio/dio.dart';
import 'package:diointerceptorexample2/dio/post.dart';
import 'package:flutter/material.dart';

class DioClient{
  static Dio dio = Dio();
  static const baseUrl = 'https://jsonplaceholder.typicode.com';
  static const postsEndPoint = baseUrl + '/posts';

  Future<Post> fetchPost (int pontId) async{
    try {
      final response = await dio.get(postsEndPoint + '/$pontId');

      debugPrint(response.toString());
      //return Post.fromJson(response.data);
    } on DioError catch (e) {
      debugPrint('status code: ${e.response?.statusCode.toString()}');
      throw Exception('Failed to load post: $pontId');
    }
  }
}