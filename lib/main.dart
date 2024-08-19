import 'package:aduio_player/core/routing/app_router.dart';
import 'package:aduio_player/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:permission_handler/permission_handler.dart';

import 'bloc/favorites/favorites_bloc.dart';
import 'bloc/home/home_bloc.dart';
import 'bloc/player/player_bloc.dart';
import 'bloc/playlists/playlists_cubit.dart';
import 'bloc/recents/recents_bloc.dart';
import 'bloc/scan/scan_cubit.dart';
import 'bloc/search/search_bloc.dart';
import 'bloc/song/song_bloc.dart';
import 'bloc/theme/theme_bloc.dart';
import 'core/di/service_locator.dart';
import 'data/services/hive_box.dart';

void main() async {
  // initialize flutter engine
  WidgetsFlutterBinding.ensureInitialized();

  // initialize dependency injection
  init();

  // ask for permission to access media if not granted
  if (!await Permission.mediaLibrary.isGranted) {
    await Permission.mediaLibrary.request();
  }

  // initialize hive
  await Hive.initFlutter();
  await Hive.openBox(HiveBox.boxName);
  // run app
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<ThemeBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SongBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<FavoritesBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<PlayerBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<RecentsBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SearchBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<ScanCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<PlaylistsCubit>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
