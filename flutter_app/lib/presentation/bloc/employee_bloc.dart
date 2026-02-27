import 'package:flutter_bloc/flutter_bloc.dart';
import 'employee_event.dart';
import 'employee_state.dart';
import '../../data/repository/employee_repository.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository repository;

  EmployeeBloc(this.repository) : super(EmployeeInitial()) {
    on<LoadEmployees>((event, emit) async {
      emit(EmployeeLoading());

      try {
        final employees = await repository.fetchEmployees();
        emit(EmployeeLoaded(employees));
      } catch (e) {
        emit(EmployeeError(e.toString()));
      }
    });
  }
}
