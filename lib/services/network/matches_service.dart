//CHIAMA LE API
import 'dart:convert';
import 'dart:io';

import 'package:matches/errors/network_error.dart';
import 'package:matches/services/network/dto/football/match_dto.dart';
import 'package:http/http.dart' as http;
import 'package:matches/env/env.dart';
import 'package:matches/services/network/dto/football/matches_response.dart';

class MatchesService {
  static const _fixturesEndpoint = 'fixtures';
  static const _xApiSportsKeyHeader = 'x-apisports-key';
  final String baseURL;

  MatchesService({required this.baseURL});
  Future<List<MatchDTO>> matches(String date) async {
    final response = await http.get(
      Uri.https(baseURL, _fixturesEndpoint, {'date': date}),
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        _xApiSportsKeyHeader: Env.footballApiKey,
      },
    );
    if (response.statusCode < 200 || response.statusCode > 299) {
      //*non a buon fine
      throw NetworkError(
          statusCode: response.statusCode, reasonPhrase: response.reasonPhrase);
    } //*interrcett dal layer superiore e comunicato all'utente
//DESERIALIZZIAMO DA API A QUALCOSA DI COMPRENSIBILE
    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    //ora costruisco con idto la lista di DTO che mi serve passare
    return MatchesResponse.fromJson(decodedResponse).response;
  }
}
