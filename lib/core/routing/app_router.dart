import 'package:aduio_player/features/home/home_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String homeRoute = '/home';
  static const String favoritesRoute = '/favorites';
  static const String recentsRoute = '/recents';
  static const String playerRoute = '/player';
  static const String artistRoute = '/artist';
  static const String albumRoute = '/album';
  static const String genreRoute = '/genre';
  static const String themesRoute = '/themes';
  static const String settingsRoute = '/settings';
  static const String playlistDetailsRoute = '/playlist';
  static const String queueRoute = '/queue';
  static const String searchRoute = '/search';
  static const String scanRoute = '/scan';
  static const String addSongToPlaylistRoute = '/addSongToPlaylist';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const HomePage(),
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Error'),
            ),
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
