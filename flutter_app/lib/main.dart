import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/screens/employee_screen.dart';
import 'presentation/bloc/employee_bloc.dart';
import 'data/repository/employee_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final repository = EmployeeRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => EmployeeBloc(repository),
        child: EmployeeScreen(),
      ),
    );
  }
}