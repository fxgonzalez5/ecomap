import 'package:ecomap/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

//* GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: CheckAuthScreen.name,
      builder: (context, state) => const CheckAuthScreen(),
    ),

    GoRoute(
      path: '/login',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    
    GoRoute(
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    
    GoRoute(
      path: '/form1',
      name: Form1Screen.name,
      builder: (context, state) => const Form1Screen(),
    ),
    
    GoRoute(
      path: '/form2',
      name: Form2Screen.name,
      builder: (context, state) => const Form2Screen(),
    ),
    
    GoRoute(
      path: '/form3',
      name: Form3Screen.name,
      builder: (context, state) => const Form3Screen(),
    ),
  ],
);