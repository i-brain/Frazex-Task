class ImageBody {
  final List imageUrlList;

  ImageBody({
    required this.imageUrlList,
  });

  factory ImageBody.fromJson(Map<String, dynamic> data) {
    return ImageBody(
      imageUrlList: data['hits'],
    );
  }
}
