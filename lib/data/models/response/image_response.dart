class ImageResponse {
  final String previewUrl;

  final String largeImageUrl;

  final String userImageUrl;

  final String username;

  ImageResponse({
    required this.previewUrl,
    required this.largeImageUrl,
    required this.userImageUrl,
    required this.username,
  });

  factory ImageResponse.fromMap(Map<String, dynamic> data) {
    return ImageResponse(
      previewUrl: data['previewURL'] as String,
      largeImageUrl: data['largeImageURL'] as String,
      userImageUrl: data['userImageURL'] as String,
      username: data['user'] as String,
    );
  }
}
