import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';
import 'package:toktik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infrastructure/repositories/video_post_repository_impl.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  //ChangeNotifierProvider crea la instancia hasta que es necesario, en este caso lo ponemos en false para que se genere al lanzarse
  @override
  Widget build(BuildContext context) {
    final VideoPostsRepository videoPostsRepository = VideoPostRepositoryImpl(videoPostsDatasource: LocalVideoDatasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(videoPostsRepository: videoPostsRepository)..loadNextPage(),
        ),
      ], //.. = cascades
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
