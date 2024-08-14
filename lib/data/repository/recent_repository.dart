import 'package:aduio_player/data/services/hive_box.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../core/di/service_locator.dart';

class RecentRepository {
  final box = Hive.box('myBox');
  Future<List<SongModel>> fetchRecent()async{
    List<String> recentSongsIds = box.get(
      HiveBox.recentlyPlayedSongsKey,
      defaultValue: List<String>.empty(),
    );
    OnAudioQuery audioQuery = sl<OnAudioQuery>();
    List<SongModel> songs = await audioQuery.querySongs(
      uriType: UriType.EXTERNAL,
    );

    // sort songs by recent songs ids
    songs.sort((a, b) => recentSongsIds
        .indexOf(a.id.toString())
        .compareTo(recentSongsIds.indexOf(b.id.toString())));

    return songs
        .where((song) => recentSongsIds.contains(song.id.toString()))
        .toList();
  }

  Future<SongModel?> fetchLastPlayed() async {
    var recent = await fetchRecent();

    if (recent.isNotEmpty) {
      return recent.first;
    } else {
      return null;
    }
  }
}
