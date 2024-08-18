import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:on_audio_query/on_audio_query.dart';

import '../../data/repository/recent_repository.dart';

part 'recents_event.dart';
part 'recents_state.dart';

class RecentsBloc extends Bloc<RecentsEvent, RecentsState> {
  RecentsBloc({required RecentRepository repository})
      : super(RecentsInitial()) {
    on<FetchRecents>((event, emit) async {
      emit(RecentsLoading());
      try {
        final favoriteSongs = await repository.fetchRecent();
        emit(RecentsLoaded(favoriteSongs));
      } catch (e) {
        emit(RecentsError(e.toString()));
      }
    });
  }
}
