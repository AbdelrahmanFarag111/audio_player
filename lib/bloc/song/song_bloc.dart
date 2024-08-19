import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../data/repository/song_repository.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  SongBloc({required SongsRepository repository}) : super(PlayerInitial()) {
    on<ToggleFavorite>((event, emit) async {
      emit(ToggleFavoriteInProgress());
      try {
        await repository.toggleFavorite(event.songId);
        emit(ToggleFavoriteSuccess());
      } catch (e) {
        emit(ToggleFavoriteFailure());
      }
    });
    on<AddToRecentlyPlayed>((event, emit) async {
      emit(AddToRecentlyPlayedInProgress());
      try {
        await repository.addToRecentlyPlayed(event.songId);
        emit(AddToRecentlyPlayedSuccess());
      } catch (e) {
        emit(AddToRecentlyPlayedError());
      }
    });
  }
}
