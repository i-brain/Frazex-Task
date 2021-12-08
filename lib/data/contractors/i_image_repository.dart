import 'package:multiple_result/multiple_result.dart';
import 'package:task/data/models/response/image_body.dart';

abstract class IimageRepository {
  Future<Result<String, List<ImageResponse>>> fetchImages();
}
