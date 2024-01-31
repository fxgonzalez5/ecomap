import 'package:ecomap/di/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecomap/config/router/app_router.dart';
import 'package:ecomap/config/theme/app_theme.dart';
import 'package:ecomap/presentation/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ...getProviders()
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'EcoMap',
        routerConfig: appRouter,
        theme: AppTheme().getTheme(context),     
      ),
    );
  }
}