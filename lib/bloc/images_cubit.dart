import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/bloc/images_state.dart';
import 'package:unsplash_gallery/network/images_repository.dart';

class ImagesCubit extends Cubit<ImagesState> {
  final ImagesRepository repo;

  ImagesCubit({
    required ImagesState initialState,
    required this.repo,
  }) : super(initialState);

  void fetchImages() async {
    final images = await repo.fetchImages();
    emit(ImagesState(images));
  }
}
