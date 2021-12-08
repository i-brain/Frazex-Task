import 'package:multiple_result/multiple_result.dart';

import 'package:task/config/init.dart';
import 'package:task/data/contractors/i_image_repository.dart';
import 'package:task/data/data_sources/image_data_source.dart';
import 'package:task/data/models/response/image_body.dart';

class ImageRepository implements IimageRepository {
  final dataSource = locator.get<ImageDataSource>();

  @override
  Future<Result<String, List<ImageResponse>>> fetchImages() async {
    try {
      final imageBody = await dataSource.fetchImages();

      return Success(imageBody.imageUrlList);
    } catch (error) {
      return Error(error.toString());
    }
  }
}
