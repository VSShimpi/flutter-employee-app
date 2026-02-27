import 'dart:convert';
import 'package:employee_app/core/constants.dart';
import 'package:http/http.dart' as http;
import '../models/employee_model.dart';

class EmployeeRepository {
  Future<List<Employee>> fetchEmployees() async {
    final response = await http.get(
      Uri.parse("${Api.apiurl}/employee_api/employees.php"),
    );
    final List data = jsonDecode(response.body);

    return data.map((e) => Employee.fromJson(e)).toList();
  }
}
