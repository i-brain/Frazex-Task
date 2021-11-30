class ImageResponse {
  final String previewUrl;

  final String largeImageUrl;

  final String userImageUrl;

  final String username;

  final int like;

  final String tags;

  ImageResponse({
    required this.previewUrl,
    required this.largeImageUrl,
    required this.userImageUrl,
    required this.username,
    required this.like,
    required this.tags,
  });

  factory ImageResponse.fromMap(Map<String, dynamic> data) {
    return ImageResponse(
      previewUrl: data['previewURL'] as String,
      largeImageUrl: data['largeImageURL'] as String,
      userImageUrl: data['userImageURL'] as String,
      username: data['user'] as String,
      like: data['likes'] as int,
      tags: data['tags'] as String,
    );
  }
}
