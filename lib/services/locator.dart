import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:podcasts_app/services/locator.config.dart';

final locator = GetIt.asNewInstance();

@InjectableInit()
void setupLocator() => locator.init();
