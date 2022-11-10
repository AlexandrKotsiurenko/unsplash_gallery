import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:unsplash_gallery/network/image_model.dart';

class ImagesRepository {
  final Dio dio;

  ImagesRepository(this.dio);

  Future<List<ImageModel>> fetchImages() async {
    final response = await dio.get(
      'https://api.unsplash.com/photos',
      queryParameters: {
        'client_id':
            '896d4f52c589547b2134bd75ed48742db637fa51810b49b607e37e46ab2c0043'
      },
    );
    final List<ImageModel> images = response.data
        .map<ImageModel>(
          (e) => ImageModel(
            e['user']['name'] as String,
            e['user']['username'] as String,
            e['urls']['full'] as String,
            e['likes'] as int,
          ),
        )
        .toList();
    return images;
  }
}
