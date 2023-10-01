import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
  filter: DevelopmentFilter(),
);

var loggerNoStack = Logger(
  printer: PrettyPrinter(methodCount: 0),
  filter: DevelopmentFilter(),
);
