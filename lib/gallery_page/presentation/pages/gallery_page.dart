import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/bloc/images_cubit.dart';
import 'package:unsplash_gallery/bloc/images_state.dart';
import 'package:unsplash_gallery/gallery_page/presentation/widgets/image_item.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagesCubit, ImagesState>(
      builder: (BuildContext context, state) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: state.images.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return ImageItem(
                imageModel: state.images[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
