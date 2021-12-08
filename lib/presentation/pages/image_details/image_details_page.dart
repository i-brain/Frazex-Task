import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/constants/app_text_styles.dart';
import 'package:task/constants/assets.dart';
import 'package:task/data/data_sources/notification_data_source.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:task/data/models/response/image_body.dart';

class ImageDetailsPage extends StatelessWidget {
  const ImageDetailsPage({
    Key? key,
    required this.imageResponse,
  }) : super(key: key);

  final ImageResponse imageResponse;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.imageDetails),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Row(
                children: [
                  CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                        imageUrl: imageResponse.userImageUrl,
                        placeholder: (context, url) => const CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          Assets.images.avatar,
                          fit: BoxFit.fill,
                        ),
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
          ),
          Expanded(
            flex: 6,
            child: CachedNetworkImage(
              imageUrl: imageResponse.largeImageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                InkWell(
                  onTap: NotificationDataSource.showNotification,
                  child: Icon(
                    Icons.favorite_border,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.mode_comment_outlined,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.send,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: RichText(
              text: TextSpan(style: AppTextStyles.interW500, children: [
                TextSpan(text: imageResponse.like.toString() + ' '),
                TextSpan(text: locale.likes),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: RichText(
              text: TextSpan(
                style: AppTextStyles.interW500,
                children: [
                  TextSpan(text: locale.tags + ' : '),
                  TextSpan(
                    text: imageResponse.tags,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
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
