import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task/config/configs.dart';
import 'package:task/data/models/response/image_body.dart';

part 'image_data_source.g.dart';

@RestApi(baseUrl: Configs.baseUrl)
abstract class ImageDataSource {
  factory ImageDataSource(Dio dio, {String baseUrl}) = _ImageDataSource;

  @GET('')
  Future<ImageBody> fetchImages();
}
