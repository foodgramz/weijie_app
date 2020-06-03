import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  locator.registerSingleton(sharedPreferences);
}

void resetLocatorInstance(
    {Object instance, String instanceName, Function disposingFunction}) {
  locator.resetLazySingleton<dynamic>(
      instance: instance,
      instanceName: instanceName,
      disposingFunction: (dynamic item) {
        print(item);
      });
}
