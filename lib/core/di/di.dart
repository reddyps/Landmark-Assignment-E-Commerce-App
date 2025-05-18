import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'di.config.dart'; // Import the generated file

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // Default name, keep it
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() {
  $initGetIt(getIt);
}