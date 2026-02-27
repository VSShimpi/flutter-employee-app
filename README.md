# Employee List Task (Flutter + PHP + MySQL)

This project is developed as a technical assessment task.

It demonstrates fetching employee data from a PHP REST API and displaying it in a Flutter application using Bloc State Management.

---

## Implemented Features

- ✔ Fetch Employee Data from REST API
- ✔ Display Employee List in Flutter
- ✔ Conditional Highlighting of Employees
- ✔ Bloc State Management
- ✔ PHP API using XAMPP
- ✔ MySQL Database Connectivity
- ✔ Simple and Clean UI

---

## 🛠 Tech Stack

### Frontend
- Flutter
- Dart
- flutter_bloc

### Backend
- PHP (Core PHP API)
- MySQL
- XAMPP Server

---

## 📂 Project Structure
employee-management-system
│
├── frontend/
│ └── employee_manage_flutter/
│
├── backend/
│ └── employee_api/
│ └── employee.php
│
├── database/
│ └── employee_db.sql
│
├── README.md
└── .gitignore


---

## ⚙️ Setup Instructions

### Backend Setup (XAMPP)

1. Install XAMPP
2. Copy `employee_api` folder into:
3. Start Apache and MySQL.

---
### Database Setup

1. Open phpMyAdmin
2. Create database:
3. Import SQL file from `database/employee_db.sql`.

---

### Configure API URL
Update API base URL inside Flutter project:


Example:

```dart
const baseUrl = "http://10.0.2.2/employee_api/";

flutter pub get
flutter run

