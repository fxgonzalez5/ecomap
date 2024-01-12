import 'package:ecomap/domain/domain.dart';

class CurrentUser{
  String name;
  String email;
  String role;
  String project;

  CurrentUser({required this.name,required this.email, required this.role, required this.project});
}