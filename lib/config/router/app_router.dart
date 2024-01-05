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
      path: '/email',
      name: EmailScreen.name,
      builder: (context, state) => const EmailScreen(),
    ),
    
    GoRoute(
      path: '/verification',
      name: VerificationScreen.name,
      builder: (context, state) => const VerificationScreen(),
    ),
    
    GoRoute(
      path: '/reset_password',
      name: ResetPasswordScreen.name,
      builder: (context, state) => const ResetPasswordScreen(),
    ),
    
    GoRoute(
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);