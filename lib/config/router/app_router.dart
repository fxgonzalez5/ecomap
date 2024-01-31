import 'package:ecomap/presentation/screens/reports/socio_bosque.dart';
import 'package:ecomap/presentation/screens/reports/socio_bosque_detalle.dart';
import 'package:ecomap/presentation/screens/screens.dart';
import 'package:ecomap/presentation/screens/visualization/control_forestal.dart';
import 'package:ecomap/presentation/screens/visualization/socio_bosque.dart';
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
      builder: (context, state) => const FormRestauracionForestalBeneficiarioScreen(),
    ),
    GoRoute(
      path: '/restauracion-forestal-ubicacion-form',
      name: FormRestauracionForestalUbicacionScreen.name,
      builder: (context, state) => const FormRestauracionForestalUbicacionScreen(),
    ),
    GoRoute(
      path: '/restauracion-forestal-potenciacion-form',
      name: FormRestauracionForestalPotenciacionScreen.name,
      builder: (context, state) => const FormRestauracionForestalPotenciacionScreen(),
    ),
    GoRoute(
      path: '/visualization-restauracion-forestal',
      name: VisualizationRestauracionForestalScreen.name,
      builder: (context, state) => const VisualizationRestauracionForestalScreen(),
    ),
    GoRoute(
      path: '/report-restauracion-forestal',
      name: ReportRestauracionForestalScreen.name,
      builder: (context, state) => const ReportRestauracionForestalScreen(),
    ),
    GoRoute(
      path: '/report-restauracion-forestal-detalle',
      name: ReportRestauracionForestalDetalleScreen.name,
      builder: (context, state) => const ReportRestauracionForestalDetalleScreen(),
    ),
    GoRoute(
      path: '/visualization-socio-bosque',
      name: VisualizationSocioBosqueScreen.name,
      builder: (context, state) => const VisualizationSocioBosqueScreen(),
    ),
    GoRoute(
      path: '/report-socio-bosque',
      name: ReportSocioBosqueScreen.name,
      builder: (context, state) => const ReportSocioBosqueScreen(),
    ),
    GoRoute(
      path: '/report-socio-bosque-detalle',
      name: ReportSocioBosqueDetalleScreen.name,
      builder: (context, state) => const ReportSocioBosqueDetalleScreen(),
    ),
    GoRoute(
      path: '/form-control-forestal-propietario',
      name: FormControlForestalPropietarioScreen.name,
      builder: (context, state) => const FormControlForestalPropietarioScreen(),
    ),
    GoRoute(
      path: '/form-control-forestal-linea',
      name: FormControlForestaLineaScreen.name,
      builder: (context, state) => const FormControlForestaLineaScreen(),
    ),
    GoRoute(
      path: '/form-control-forestal-poblacion',
      name: FormControlForestaPoblacionScreen.name,
      builder: (context, state) => const FormControlForestaPoblacionScreen(),
    ),
    GoRoute(
      path: '/visualization-control-forestal',
      name: VisualizationControlForestalScreen.name,
      builder: (context, state) => const VisualizationControlForestalScreen(),
    ),
    GoRoute(
      path: '/report-control-forestal',
      name: ReportControlForestalScreen.name,
      builder: (context, state) => const ReportControlForestalScreen(),
    ),
    GoRoute(
      path: '/report-control-forestal-detalle',
      name: ReportControlForestalDetalleScreen.name,
      builder: (context, state) => const ReportControlForestalDetalleScreen(),
    ),
  ],
);
