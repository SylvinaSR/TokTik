import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  //TODO repository, datasource

  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    //En este caso (video) es cada video que tenemos en local_video_post (vendria siendo como un response de API)
    //Llamamos a nuestro model y transformamos ese response en un LocalVideoModel
    //Luego eso se convierte en un entity de VideoPost

    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);
    initialLoading = false;

    notifyListeners();
  }
}
