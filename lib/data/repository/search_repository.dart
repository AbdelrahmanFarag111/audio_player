import 'package:aduio_player/data/model/search_result.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../core/di/service_locator.dart';

class SearchRepository {
  final _audioQuery = sl<OnAudioQuery>();

  Future<SearchResultModel> search(String query) async {
    final List<dynamic> songs = await _audioQuery.queryWithFilters(
      query,
      WithFiltersType.AUDIOS,
    );
    final List<dynamic> albums = await _audioQuery.queryWithFilters(
      query,
      WithFiltersType.ALBUMS,
    );
    final List<dynamic> artists = await _audioQuery.queryWithFilters(
      query,
      WithFiltersType.ARTISTS,
    );
    final List<dynamic> genres = await _audioQuery.queryWithFilters(
      query,
      WithFiltersType.GENRES,
    );
    return SearchResultModel(
      songs: songs.map((e) => SongModel(e)).toList(),
      artist: artists.map((e)=>ArtistModel(e)).toList(),
      albums: albums.map((e)=>AlbumModel(e)).toList(),
      geners: genres.map((e)=>GenreModel(e)).toList(),
    );
  }
}
