class Employee {
  final String name;
  final int years;
  final bool isActive;

  Employee({
    required this.name,
    required this.years,
    required this.isActive,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      name: json['name'],
      years: json['years'],
      isActive: json['is_active'],
    );
  }
}