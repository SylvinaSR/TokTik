import 'package:toktik/domain/entities/video_post.dart';

abstract class VideoPostsRepository {
  //Abstracto para no generar instancias de esta clase

  Future<List<VideoPost>> getTrendingVideosByPage(int page);

  Future<List<VideoPost>> getTrendingVideosByUser(String userId);

}
