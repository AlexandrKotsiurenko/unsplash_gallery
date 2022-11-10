import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_gallery/bloc/images_cubit.dart';
import 'package:unsplash_gallery/bloc/images_state.dart';
import 'package:unsplash_gallery/gallery_page/presentation/pages/gallery_page.dart';
import 'package:unsplash_gallery/network/images_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ImagesCubit(
        initialState: ImagesState([]),
        repo: ImagesRepository(Dio()),
      )..fetchImages(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GalleryPage(),
      ),
    );
  }
}
