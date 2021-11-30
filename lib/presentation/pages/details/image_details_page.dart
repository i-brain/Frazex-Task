import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:task/constants/app_text_styles.dart';
import 'package:task/constants/assets.dart';
import 'package:task/data/models/response/image_response.dart';

class ImageDetailsPage extends StatelessWidget {
  const ImageDetailsPage({
    Key? key,
    required this.imageResponse,
  }) : super(key: key);

  final ImageResponse imageResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 5,
            child: CachedNetworkImage(
              imageUrl: imageResponse.largeImageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      imageUrl: imageResponse.userImageUrl,
                      errorWidget: (context, url, error) => Image.asset(
                        Assets.images.avatar,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    imageResponse.username,
                    style: AppTextStyles.interW500.copyWith(fontSize: 18),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
