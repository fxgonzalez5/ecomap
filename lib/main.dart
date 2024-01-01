import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:ecomap/config/firebase/firebase_options.dart';
import 'package:ecomap/config/router/app_router.dart';
import 'package:ecomap/config/theme/app_theme.dart';
import 'package:ecomap/presentation/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
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