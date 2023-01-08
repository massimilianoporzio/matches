import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matches/errors/repository_error.dart';
import 'package:matches/repositories/matches_repository.dart';
import 'package:matches/models/match.dart';
part 'matches_event.dart';
part 'matches_state.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  final MatchesRepository matchesRepository;

  MatchesBloc({required this.matchesRepository})
      : super(FecthingMatchesState()) {
    on<FetchMatchesEvent>(_onFetch);
  }

  FutureOr<void> _onFetch(
      FetchMatchesEvent event, Emitter<MatchesState> emit) async {
    //QUANDO SUL BLOC ARRIVA EVENTO CARICA I MATCHES
    emit(FecthingMatchesState()); //* sto caricando
    try {
      //*la data arriva dall'eevnto
      final matches = await matchesRepository.matches(event.date);
      //*se è andato a buon fine ho lista di Match e la passo all'evento fetched
      emit(matches.isEmpty
          ? NoMatchesState()
          : FetchedMatchesState(matches: matches));
    } on RepositoryError catch (e) {
      emit(ErrorMatchesState(
          e.errorMessage)); //*COMUNICO ALLA UI CON LO STATO ERROR
    } catch (e) {
      emit(const ErrorMatchesState()); //*comunico errore generico
    }
  }

  void fetchMatches(DateTime date) => add(FetchMatchesEvent(date));
}
