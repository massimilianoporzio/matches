part of 'matches_bloc.dart';

abstract class MatchesState extends Equatable {
  const MatchesState();
  @override
  List<Object?> get props => []; //*vale per tutte le sottoclassi
}

class FecthingMatchesState extends MatchesState {
  //*no props
}

class FetchedMatchesState extends MatchesState {
  final List<Match> matches;

  const FetchedMatchesState({required this.matches});

  @override
  List<Object?> get props => [matches];
}

class NoMatchesState extends MatchesState {
  //*no props

}

class ErrorMatchesState extends MatchesState {
  final String? errorMessage;

  const ErrorMatchesState([this.errorMessage]);

  @override
  List<Object?> get props => [errorMessage];
}
