import 'package:grigora/services/api_service.dart';

import 'package:get_it/get_it.dart';

import 'package:grigora/services/navigtion_service.dart';
import 'package:grigora/viewmodel/detail_view_model.dart';
import 'package:grigora/viewmodel/home_viewmodel.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ApiService());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => DetailViewModel());
}
