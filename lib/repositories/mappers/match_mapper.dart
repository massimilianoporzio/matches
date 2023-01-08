import 'package:matches/misc/mapper.dart';
import 'package:matches/services/network/dto/football/match_dto.dart';
import 'package:matches/models/match.dart';

class MatchMapper extends DTOMapper<MatchDTO, Match> {
  @override
  Match toModel(MatchDTO dto) {
    return Match(
        arbitro: dto.details.referee,
        dateTime: dto.details.date,
        stadio: dto.details.venue.name,
        elapsed: dto.details.status.elapsed,
        league: League(
            name: dto.league.name,
            round: dto.league.round,
            imageUrl: dto.league.logo),
        teams: Teams(
          home: Team(
            name: dto.teams.home.name,
            logoUrl: dto.teams.home.logo,
            goals: dto.score.fulltime.home ?? dto.score.halftime.home ?? 0,
          ),
          away: Team(
            name: dto.teams.away.name,
            logoUrl: dto.teams.away.logo,
            goals: dto.score.fulltime.away ?? dto.score.halftime.away ?? 0,
          ),
        ),
        status: _mapMatchStatus(dto.details.status.short));
  }

  @override
  MatchDTO toDTO(Match model) {
    // TODO: implement toDTO
    throw UnimplementedError();
  }

  MatchStatus? _mapMatchStatus(String short) {
    MatchStatus? status;
    try {
      status = MatchStatus.values.byName(short);
    } on ArgumentError catch (e) {
      return null;
    }

    return status;
  }
}
