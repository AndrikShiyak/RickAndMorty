import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rick_and_morty_clean_practice/src/presentation/widgets/shimmer_widget.dart';

class CachedNetworkImageWidget extends HookWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
  });

  final String imageUrl;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        fadeInDuration: Duration.zero,
        imageUrl: imageUrl,
        placeholder: (context, url) => ShimmerWidget(
              width: width,
              height: height,
            ),
        imageBuilder: (context, imageProvider) => Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
        errorWidget: (context, url, error) {
          return Container(
            color: Theme.of(context).errorColor,
            alignment: Alignment.center,
            width: width,
            height: height,
            child: const Icon(Icons.error),
          );
        });
  }
}
