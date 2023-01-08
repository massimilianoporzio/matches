import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env') //*dico dove andare a leggere .env
abstract class Env {
  @EnviedField(varName: 'API_SPORTS_FOTTOBAL_KEY', obfuscate: true)
  static const footballApiKey = _Env.footballApiKey;
}
