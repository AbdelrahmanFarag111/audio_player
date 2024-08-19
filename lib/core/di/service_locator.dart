import 'package:get_it/get_it.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../bloc/favorites/favorites_bloc.dart';
import '../../bloc/home/home_bloc.dart';
import '../../bloc/player/player_bloc.dart';
import '../../bloc/playlists/playlists_cubit.dart';
import '../../bloc/recents/recents_bloc.dart';
import '../../bloc/scan/scan_cubit.dart';
import '../../bloc/search/search_bloc.dart';
import '../../bloc/song/song_bloc.dart';
import '../../bloc/theme/theme_bloc.dart';
import '../../data/repository/favorite_repository.dart';
import '../../data/repository/home_repository.dart';
import '../../data/repository/player_repository.dart';
import '../../data/repository/recent_repository.dart';
import '../../data/repository/search_repository.dart';
import '../../data/repository/song_repository.dart';
import '../../data/repository/theme_repository.dart';

final sl = GetIt.instance;

void init() {
  // Bloc
  sl.registerFactory(() => ThemeBloc(repository: sl()));
  sl.registerFactory(() => HomeBloc(repository: sl()));
  sl.registerFactory(() => PlayerBloc(repository: sl()));
  sl.registerFactory(() => SongBloc(repository: sl()));
  sl.registerFactory(() => FavoritesBloc(repository: sl()));
  sl.registerFactory(() => RecentsBloc(repository: sl()));
  sl.registerFactory(() => SearchBloc(repository: sl()));
  // Cubit
  sl.registerFactory(() => ScanCubit());
  sl.registerFactory(() => PlaylistsCubit());

  // Repository
  sl.registerLazySingleton(() => ThemeRepository());
  sl.registerLazySingleton(() => HomeRepository());
  sl.registerLazySingleton<MusicPlayer>(
        () => JustAudioPlayer(),
  );
  sl.registerLazySingleton(() => SongsRepository());
  sl.registerLazySingleton(() => FavoritesRepository());
  sl.registerLazySingleton(() => RecentRepository());
  sl.registerLazySingleton(() => SearchRepository());

  // Third Party
  sl.registerLazySingleton(() => OnAudioQuery());
}
