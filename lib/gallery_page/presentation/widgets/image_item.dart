import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:unsplash_gallery/src/app_colors.dart';
import 'package:unsplash_gallery/gallery_page/presentation/widgets/image_dialog.dart';
import 'package:unsplash_gallery/network/image_model.dart';

class ImageItem extends StatelessWidget {
  final ImageModel imageModel;

  const ImageItem({
    required this.imageModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return ImageDialog(
              imageUrl: imageModel.url,
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.main,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 190,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                    bottom: Radius.zero,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: CachedNetworkImage(
                  imageUrl: imageModel.url,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          imageModel.name,
                          style: const TextStyle(fontSize: 13),
                        ),
                        Text(
                          'by ${imageModel.author}',
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.favorite_border,
                            color: AppColors.red,
                          ),
                        ),
                        Text(
                          imageModel.likesCount.toString(),
                          style: const TextStyle(fontSize: 7),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
