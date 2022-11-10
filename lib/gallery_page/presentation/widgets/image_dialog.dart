import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageDialog extends StatelessWidget {
  final String imageUrl;

  const ImageDialog({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
