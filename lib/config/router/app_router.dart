import 'package:ecomap/presentation/screens/screens.dart';
import 'package:ecomap/presentation/screens/visualization/restauracion_forestal.dart';
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
      builder: (context, state) => HomeScreen(),
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
    GoRoute(
      path: '/form6',
      name: Form6Screen.name,
      builder: (context, state) => const Form6Screen(),
    ),
    GoRoute(
      path: '/form7',
      name: Form7Screen.name,
      builder: (context, state) => const Form7Screen(),
    ),
    GoRoute(
      path: '/form8',
      name: Form8Screen.name,
      builder: (context, state) => const Form8Screen(),
    ),
    GoRoute(
      path: '/form9',
      name: Form9Screen.name,
      builder: (context, state) => const Form9Screen(),
    ),
    GoRoute(
      path: '/restauracion-forestal-beneficiario-form',
      name: FormRestauracionForestalBeneficiarioScreen.name,
      builder: (context, state) => FormRestauracionForestalBeneficiarioScreen(),
    ),
    GoRoute(
      path: '/restauracion-forestal-ubicacion-form',
      name: FormRestauracionForestalUbicacionScreen.name,
      builder: (context, state) => FormRestauracionForestalUbicacionScreen(),
    ),
    GoRoute(
      path: '/restauracion-forestal-potenciacion-form',
      name: FormRestauracionForestalPotenciacionScreen.name,
      builder: (context, state) => FormRestauracionForestalPotenciacionScreen(),
    ),
    GoRoute(
      path: '/visualization-restauracion-forestal',
      name: VisualizationRestauracionForestalScreen.name,
      builder: (context, state) => VisualizationRestauracionForestalScreen(),
    ),
    GoRoute(
      path: '/report-restauracion-forestal',
      name: ReportRestauracionForestalScreen.name,
      builder: (context, state) => ReportRestauracionForestalScreen(),
    ),
    GoRoute(
      path: '/report-restauracion-forestal-detalle',
      name: ReportRestauracionForestalDetalleScreen.name,
      builder: (context, state) => ReportRestauracionForestalDetalleScreen(),
    ),
  ],
);
