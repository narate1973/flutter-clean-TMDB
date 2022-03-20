import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nutthemovie/core/app_component/app_shimmer/app_shimmer.dart';

class AppNetWorkImage extends StatelessWidget {
  final String imageURL;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final BoxShape boxShape;
  final Color loadingColor;
  final String? errorImgPath;
  final int maxHeightDiskCache;
  final int maxWidthDiskCache;

  const AppNetWorkImage._({
    required Key key,
    required this.boxShape,
    required this.imageURL,
    required this.loadingColor,
    required this.maxHeightDiskCache,
    required this.maxWidthDiskCache,
    this.errorImgPath,
    this.borderRadius,
    this.height,
    this.width,
  }) : super(key: key);

  static Widget circle({
    required double size,
    required String imageURL,
    Color? loadingColor,
    String? errorImgPath,
    int? maxHeightDiskCache,
    int? maxWidthDiskCache,
  }) =>
      AppNetWorkImage._(
        key: UniqueKey(),
        width: size,
        height: size,
        imageURL: imageURL,
        boxShape: BoxShape.circle,
        loadingColor: loadingColor ?? Colors.grey,
        errorImgPath: errorImgPath,
        maxHeightDiskCache: maxHeightDiskCache ?? 400,
        maxWidthDiskCache: maxWidthDiskCache ?? 400,
      );

  static Widget rect(
    String imageURL, {
    double? width,
    double? height,
    BorderRadius? borderRadius,
    Color? loadingColor,
    String? errorImgPath,
    int? maxHeightDiskCache,
    int? maxWidthDiskCache,
  }) =>
      AppNetWorkImage._(
        key: UniqueKey(),
        width: width,
        height: height,
        imageURL: imageURL,
        boxShape: BoxShape.rectangle,
        borderRadius: borderRadius,
        loadingColor: loadingColor ?? Colors.grey,
        errorImgPath: errorImgPath,
        maxHeightDiskCache: maxHeightDiskCache ?? 400,
        maxWidthDiskCache: maxWidthDiskCache ?? 400,
      );

  @override
  Widget build(BuildContext context) {
    switch (boxShape) {
      case BoxShape.rectangle:
        return _buildRect(context);
      case BoxShape.circle:
        return _buildCircle(context);
      default:
        return _buildRect(context);
    }
  }

  Widget _buildRect(BuildContext context) {
    return CachedNetworkImage(
      key: key,
      maxHeightDiskCache: maxHeightDiskCache,
      maxWidthDiskCache: maxWidthDiskCache,
      imageUrl: imageURL,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      placeholder: (context, url) {
        return AppShimmer.rect(
          width: width,
          height: height,
          color: loadingColor,
          borderRadius: borderRadius,
        );
      },
      errorWidget: (context, url, error) {
        return Visibility(
          visible: errorImgPath == null,
          child: AppShimmer.rect(
            width: width,
            height: height,
            color: loadingColor,
            borderRadius: borderRadius,
          ),
          replacement: ClipRRect(
            borderRadius: borderRadius,
            child: Image.asset(
              errorImgPath!,
              width: width,
              height: height,
            ),
          ),
        );
      },
    );
  }

  Widget _buildCircle(BuildContext context) {
    return CachedNetworkImage(
      key: key,
      maxHeightDiskCache: maxHeightDiskCache,
      maxWidthDiskCache: maxWidthDiskCache,
      imageUrl: imageURL,
      imageBuilder: (context, imageProvider) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            borderRadius: borderRadius,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      placeholder: (context, url) {
        return AppShimmer.circle(
          size: width!,
          color: loadingColor,
        );
      },
      errorWidget: (context, url, error) {
        return Visibility(
          visible: errorImgPath == null,
          child: AppShimmer.circle(
            size: width!,
            color: loadingColor,
          ),
          replacement: ClipRRect(
            borderRadius: BorderRadius.circular(120),
            child: Image.asset(
              errorImgPath!,
              width: width,
              height: height,
            ),
          ),
        );
      },
    );
  }
}
