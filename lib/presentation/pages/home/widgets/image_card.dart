import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task/constants/routes.dart';
import 'package:task/data/models/response/image_response.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.imageResponse,
  }) : super(key: key);

  final ImageResponse imageResponse;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.imageDetails,
          arguments: imageResponse),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: imageResponse.largeImageUrl,
          fit: BoxFit.fill,
          placeholder: (context, url) => Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
