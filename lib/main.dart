import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:matches/app.dart';
import 'package:matches/env/env.dart';

void main() {
  initializeDateFormatting('it', null);
  runApp(const App());
}
