import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/employee_bloc.dart';
import '../bloc/employee_event.dart';
import '../bloc/employee_state.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {

  @override
  void initState() {
    super.initState();
    context.read<EmployeeBloc>().add(LoadEmployees());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Employees"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: BlocBuilder<EmployeeBloc, EmployeeState>(
        builder: (context, state) {
          if (state is EmployeeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is EmployeeLoaded) {
          return RefreshIndicator(
  onRefresh: () async {
    context.read<EmployeeBloc>().add(LoadEmployees());
  },
  child: ListView.builder(
    physics: const AlwaysScrollableScrollPhysics(),
    itemCount: state.employees.length,
    itemBuilder: (context, index) {

      final emp = state.employees[index];

      bool highlight =
          emp.years > 5 && emp.isActive;

      return Card(
        margin: const EdgeInsets.symmetric(
            horizontal: 12, vertical: 6),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: highlight
            ? Colors.green.shade100
            : Colors.white,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 10),
          title: Text(
            emp.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                "Years in Organization: ${emp.years}",
              ),
              Text(
                emp.isActive
                    ? "Status: Active"
                    : "Status: Inactive",
                style: TextStyle(
                  color: emp.isActive
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          trailing: highlight
              ? const Icon(
                  Icons.verified,
                  color: Colors.green,
                )
              : null,
        ),
      );
    },
  ),
);
          }
          if (state is EmployeeError) {
            return Center(
              child: Text(state.message),
            );
          }
          return const Center(
            child: Text("Something went wrong"),
          );
        },
      ),
    );
  }
}