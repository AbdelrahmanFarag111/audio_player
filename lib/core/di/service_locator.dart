import 'package:get_it/get_it.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../data/repository/favorite_repository.dart';
import '../../data/repository/player_repository.dart';
import '../../data/repository/recent_repository.dart';
import '../../data/repository/search_repository.dart';
import '../../data/repository/song_repository.dart';
import '../../data/repository/theme_repository.dart';

final sl = GetIt.instance;

void init() {
  // Repository
  sl.registerLazySingleton(
    () => ThemeRepository(),
  );
  sl.registerLazySingleton(
    () => SongRepository(),
  );
  sl.registerLazySingleton<MusicPlayer>(
    () => JustAudioPlayer(),
  );
  sl.registerLazySingleton(() => SongRepository());
  sl.registerLazySingleton(() => FavoritesRepository());
  sl.registerLazySingleton(() => RecentRepository());
  sl.registerLazySingleton(() => SearchRepository());

  // Third Party
  sl.registerLazySingleton(() => OnAudioQuery());
}
