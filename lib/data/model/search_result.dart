import 'package:on_audio_query/on_audio_query.dart';

class SearchResultModel {
  final List<SongModel> songs;
  final List<ArtistModel> artist;
  final List<AlbumModel> albums;
  final List<GenreModel> geners;

  SearchResultModel({
    required this.songs,
    required this.artist,
    required this.albums,
    required this.geners,
  });
}
