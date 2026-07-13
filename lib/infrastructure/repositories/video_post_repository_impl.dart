import 'package:toktik/domain/datasources/video_posts_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

class VideoPostRepositoryImpl implements VideoPostsRepository {
  final VideoPostsDatasource videoPostsDatasource;

  VideoPostRepositoryImpl({required this.videoPostsDatasource});

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videoPostsDatasource.getTrendingVideosByPage(page);
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByUser(String userId) {
    throw UnimplementedError();
  }
}
