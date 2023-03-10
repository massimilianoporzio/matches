import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matches/pages/main_page.dart';
import 'package:matches/repositories/mappers/match_mapper.dart';
import 'package:matches/repositories/matches_repository.dart';
import 'package:matches/services/network/matches_service.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MatchMapper>(
          create: (context) => MatchMapper(),
        ), //* ho iniettato un Mapper
      ],
      child: MultiProvider(
        providers: [
          Provider<MatchesService>(
            create: (context) =>
                const MatchesService(baseURL: 'v3.football.api-sports.io'),
          ),
        ],
        child: MultiRepositoryProvider(
          //*più di un reposiroryProvider
          providers: [
            //*accedo ai providers iniettati nei layers precedenti
            RepositoryProvider<MatchesRepository>(
              create: (context) => MatchesRepository(
                  matchesService: context.read<MatchesService>(),
                  matchMapper: context.read<MatchMapper>()),
            )
          ],
          //*avessi bloc globali inietterei qui (ma causa rebuild)
          //*per ora l0'unico bloc è usato nella main page lo inietto lì
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Partite',
            theme: ThemeData(
              primarySwatch: Colors.indigo,
              scaffoldBackgroundColor: Colors.grey.shade300,
              appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                backgroundColor: Colors.indigo, //* stessa colorazione
                elevation: 5,
              ),
              tabBarTheme: const TabBarTheme(
                unselectedLabelColor: Color(0x88FFFFFF), //tab non sel
                labelColor: Colors.white,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              cardTheme: CardTheme(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 1),
            ),
            home: const MainPage(),
          ),
        ),
      ),
    );
  }
}
