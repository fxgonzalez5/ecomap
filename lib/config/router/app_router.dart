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
    
    GoRoute(
      path: '/form4',
      name: Form4Screen.name,
      builder: (context, state) => const Form4Screen(),
    ),

    GoRoute(
      path: '/form5',
      name: Form5Screen.name,
      builder: (context, state) => const Form5Screen(),
    ),
  ],
);