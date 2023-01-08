import 'package:equatable/equatable.dart';

enum MatchStatus {
  tbd,
  ns,
  fh,
  ht,
  sh,
  et,
  p,
  ft,
  aet,
  pen,
  bt,
  susp,
}

//*INFO SUL MATCH
class Match extends Equatable {
  final String? arbitro;
  final DateTime dateTime;
  final String? stadio;
  final MatchStatus? status;
  final int? elapsed; //minuti dall'inizio
  final League league;
  final Teams teams;

  const Match(
      {required this.arbitro,
      required this.dateTime,
      required this.stadio,
      required this.status,
      required this.elapsed,
      required this.league,
      required this.teams});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [arbitro, dateTime, stadio, status, elapsed, league, teams];
}

class League extends Equatable {
  final String name;
  final String round;
  final String imageUrl;

  const League({
    required this.name,
    required this.round,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        name,
        round,
        imageUrl,
      ];
}

class Team extends Equatable {
  final String name;
  final String logoUrl;
  final int goals;

  const Team({
    required this.name,
    required this.logoUrl,
    required this.goals,
  });

  @override
  List<Object?> get props => [
        name,
        logoUrl,
        goals,
      ];
}

class Teams extends Equatable {
  final Team home;
  final Team away;

  const Teams({
    required this.home,
    required this.away,
  });

  @override
  List<Object?> get props => [
        home,
        away,
      ];
}
