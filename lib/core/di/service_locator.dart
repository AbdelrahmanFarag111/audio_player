import 'package:get_it/get_it.dart';

import '../../data/repository/song_repository.dart';
import '../../data/repository/theme_repository.dart';

final sl = GetIt.instance;
void init(){

  // Repository
  sl.registerLazySingleton(() => ThemeRepository(),);
  sl.registerLazySingleton(() => SongRepository(),);

}
