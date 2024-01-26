import 'package:ecomap/config/firebase/firebase_options.dart';
import 'package:ecomap/data/data.dart';
import 'package:ecomap/domain/domain.dart';
import 'package:ecomap/presentation/providers/providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final getIt = GetIt.I;

Future <void> initializeDependencyInjection() async{
  await _data();
  await _view();
}

Future<void> _data()async {

  //firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  //repositories
  getIt.registerSingleton<RestauracionForestalBaseRepository>(RestuaracionForestalRepository());
  getIt.registerSingleton<SocioBosqueBaseRepository>(SocioBosqueRepository());
  getIt.registerSingleton<ProvinciaBaseRepository>(ProvinciasRepository());
  getIt.registerSingleton<BancosBaseRepository>(BancosRepository());
}

Future<void> _view() async{
  //providers
  getIt.registerFactory(() => RestauracionForestalProvider(getIt.get()));
  getIt.registerFactory(() => GeneralProvider(getIt.get(), getIt.get()));
  getIt.registerFactory(() => SocioBosqueProvider(getIt.get()));
}


List<SingleChildWidget> getProviders(){
  return[
    ChangeNotifierProvider(create: (_) => getIt<RestauracionForestalProvider>()),
    ChangeNotifierProvider(create: (_) => getIt<GeneralProvider>()),
    ChangeNotifierProvider(create: (_) => getIt<SocioBosqueProvider>()),
  ];
}