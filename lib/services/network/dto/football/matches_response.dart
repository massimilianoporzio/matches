import 'package:equatable/equatable.dart';
import 'package:matches/services/network/dto/football/match_dto.dart';

class MatchesResponse extends Equatable {
  final String get;
  final ParametersDTO parameters;
  final Map<String, String>? errors;
  final int results; //lunghezza della response da API
  final PagingDTO paging;
  final List<MatchDTO> response;

  const MatchesResponse(
      {required this.get,
      required this.parameters,
      required this.errors,
      required this.results,
      required this.paging,
      required this.response});

  factory MatchesResponse.fromJson(Map<String, dynamic> data) {
    return MatchesResponse(
        get: data['get'],
        parameters: ParametersDTO.fromJson(
          data['parameters'],
        ),
        errors: data.containsKey('errors') ? data['errors'] : null,
        results: data['results'],
        paging: PagingDTO.fromJson(data['paging']),
        response: (data['response'] as List)
            .map((e) => MatchDTO.fromJson(e as Map<String, dynamic>))
            .toList(growable: true));
  }
  //*PROPOS sono le properties con cui guardare se sono diverse tra l'oro le istanze equatable
  @override
  // TODO: implement props
  List<Object?> get props =>
      [get, parameters, errors, results, paging, response];
}

class ParametersDTO extends Equatable {
  final String date;

  const ParametersDTO(this.date);

  @override
  List<Object?> get props => [date];

  factory ParametersDTO.fromJson(Map<String, dynamic> data) {
    return ParametersDTO(data['date']);
  }
}

class PagingDTO extends Equatable {
  final int current;
  final int total;

  const PagingDTO({required this.current, required this.total});

  factory PagingDTO.fromJson(Map<String, dynamic> data) {
    return PagingDTO(current: data['current'], total: data['total']);
  }

  @override
  List<Object?> get props => [current, total];
}
