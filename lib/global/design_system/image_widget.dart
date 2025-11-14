import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class ImageWidget extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  final BoxFit fit;
  final bool isNetwork;

  const ImageWidget._internal({
    required this.path,
    required this.width,
    required this.height,
    this.fit = BoxFit.contain,
    this.isNetwork = false,
    super.key,
  });

  factory ImageWidget.network(
    String url, {
    double width = 150,
    double height = 150,
    BoxFit fit = BoxFit.contain,
    Key? key,
  }) {
    return ImageWidget._internal(
      path: url,
      width: width,
      height: height,
      fit: fit,
      isNetwork: true,
      key: key,
    );
  }

  factory ImageWidget.asset(
    String assetPath, {
    double width = 150,
    double height = 150,
    BoxFit fit = BoxFit.contain,
    Key? key,
  }) {
    return ImageWidget._internal(
      path: assetPath,
      width: width,
      height: height,
      fit: fit,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isNetwork) {
      return Image.network(
        path,
        height: height,
        width: width,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.1),
              ),
              borderRadius: BorderRadius.circular(AppConstants.mediumRadius),
            ),
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                    : null,
                color: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(AppConstants.mediumRadius),
            ),
            child: Icon(
              Icons.error_outline,
              color: Theme.of(context).colorScheme.error,
              size: width * 0.3,
            ),
          );
        },
      );
    } else {
      return Image.asset(path, width: width, height: height, fit: fit);
    }
  }
}
